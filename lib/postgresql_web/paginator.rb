module PostgresqlWeb
  class Paginator
    attr_reader :data, :page, :per_page, :total_records
    
    def initialize(data, page, per_page, total_records)
      @data = data
      @page = page.to_i
      @per_page = per_page.to_i
      @total_records = total_records.to_i
    end
    
    def offset
      if page > 0
        self.per_page * ( page - 1)
      else
        0
      end
    end
    
    def total_pages
      if self.total_records > 0
        (self.total_records.to_f / self.per_page).ceil 
      else
        1
      end
    end
    
    def first_page?
      page.to_i <= 1
    end
    def last_page?
      page == total_pages
    end
    
  end
end