Rails.application.routes.draw do
  mount PostgresqlWeb::App => "/postgresql-web"
end
