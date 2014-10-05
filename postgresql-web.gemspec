# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'postgresql-web'

Gem::Specification.new do |spec|
  spec.name          = "postgresql-web"
  spec.version       = PostgresqlWeb::VERSION
  spec.authors       = ["Allen Wei"]
  spec.email         = ["digruby@gmail.com"]
  spec.summary       = %q{A Postgresql web interface}
  spec.description   = %q{a handy hookable Postgresql web interface}
  spec.homepage      = "https://github.com/allenwei/Postgresql-Web"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'connection_pool'
  spec.add_dependency 'slim'
  spec.add_dependency 'hashie'
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rails', '~> 4.1.1'
  spec.add_development_dependency 'sinatra'
  spec.add_development_dependency 'byebug'

end
