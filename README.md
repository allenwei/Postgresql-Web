# Postgresql::Web

This application is not finished yet, please do not use it in production

A web interface of postgresql which you can mount onto your rails application

## Installation

Add this line to your application's Gemfile:

    gem 'postgresql-web'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postgresql-web

## Usage

Mount Postgresql Web application by put following code into `routes.rb`

    mount PostgresqlWeb::App => "/postgresql-web"


Then vist the appliction at `http://localhost:3000/postgresql-web`


## Contributing

1. Fork it ( https://github.com/allenwei/postgresql-web/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
