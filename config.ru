require 'bundler'
Bundler.require

require './app'

Dotenv.load

Cloudinary.config do |config|
  config.cloud_name ="demifbywq"
  config.api_key    = "355371428424886"
  config.api_secret = "SD7SG9E1aDa9lrCDbDkH8pEO6Y8"
end

run Sinatra::Application
