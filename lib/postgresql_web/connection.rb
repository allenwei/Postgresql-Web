require 'pg'
require 'connection_pool'

module PostgresqlWeb
  module Connection 
    extend self
    attr_accessor :dbname, :pool_size, :timeout
      
    def connection
      if @connection.nil?
        initial_default_params
        @connection = ConnectionPool::Wrapper.new(size: pool_size, timeout: pool_size) do 
          PG::Connection.new(dbname: dbname)
        end
      end
      @connection
    end
    
    def initial_default_params
      self.pool_size = 5;
      self.timeout = 5
      if is_pg_activerecord?
        self.dbname = ActiveRecord::Base.connection.current_database
      end
    end
    
    def is_pg_activerecord?
      defined?(Rails) and defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.adapter_name == "PostgreSQL"
    end
    
    
    def tables 
      result = connection.exec("select tablename from pg_tables where schemaname = 'public'")
      result.column_values(0).sort
    end
    
    def columns(table_name)
      connection.exec("select * from INFORMATION_SCHEMA.COLUMNS where table_name = $1", [table_name]).map do |col|
        Column.new(col)
      end
    end
    
    def data(table_name, per_page, page)
      if page <= 1
        page = 1
      end
      
      total_records = connection.exec("select count(1) from #{table_name}").column_values(0).first
      sql = "select * from #{table_name}"
      if page > 1
       sql += " offset #{per_page * (page - 1)}"
      end
      sql += " limit #{per_page}"
      puts sql
      data = connection.exec(sql).to_a
      puts 
      [data, total_records]
    end
    
  end
end