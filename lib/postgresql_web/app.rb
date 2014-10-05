require 'sinatra'
require 'slim'

module PostgresqlWeb

  class App < Sinatra::Base
    
    set :root, File.expand_path(File.dirname(__FILE__) + "/../../web")
    set :public_folder, Proc.new { "#{root}/assets" }
    set :views, Proc.new { "#{root}/views" }
    
    helpers AppHelpers
    
    get "/" do
      @tables = Connection.tables
      slim :dashboard
    end
    
    get "/columns" do 
      @columns = Connection.columns(params[:table_name])
      slim :schema, layout: false
    end
    
    get "/data" do
      @columns = Connection.columns(params[:table_name])
      
      page = params[:page].nil? ? 1 : params[:page].to_i
      per_page = 1000
      
      data, total_records = Connection.data(params[:table_name], per_page, page)
      
      @paginator = Paginator.new(data, page, per_page, total_records)
      slim :data, layout: false
    end
    
    post "/query"  do 
      begin
        @result = Connection.connection.exec(params[:query])
        slim :query, layout: false
      rescue PG::Error => e
        halt 500, e.message
      end
      
    end
  end
end
