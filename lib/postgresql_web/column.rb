require 'hashie'
module PostgresqlWeb
  class Column < Hashie::Dash
    include Hashie::Extensions::IgnoreUndeclared
    include Hashie::Extensions::IndifferentAccess
    
    property :table_name
    property :column_name
    property :ordinal_position
    property :is_nullable
    property :data_type
    property :column_default    
  end
end