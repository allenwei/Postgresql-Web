module PostgresqlWeb
  module AppHelpers
    def root_path
      "#{env['SCRIPT_NAME']}/"
    end
    
    def url_with_params(uri, params={})
      result =  URI.parse(uri)
      new_query_ar = result.query ? URI.decode_www_form(result.query) : []
      new_query_ar += params.to_a
      result.query = URI.encode_www_form(new_query_ar)
      result.to_s
    end
  end
end