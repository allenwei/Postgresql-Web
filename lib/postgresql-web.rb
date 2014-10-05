module PostgresqlWeb
  VERSION = "0.0.1"
  autoload :Column, 'postgresql_web/column'
  autoload :Paginator, 'postgresql_web/paginator'
end

require 'postgresql_web/configuration'
require 'postgresql_web/connection'
require 'postgresql_web/app_helpers'
require 'postgresql_web/app'
