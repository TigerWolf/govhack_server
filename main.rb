require 'rubygems'
require 'bundler'
Bundler.require(:default, :development)

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end


(Dir["./app/models/*.rb"].sort + Dir["./app/api/*.rb"] + Dir["./app/routes/*.rb"].sort).each do |file|
  require file
end
