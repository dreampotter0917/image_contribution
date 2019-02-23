require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection('sqlite3:db/development.db')
end

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")

class Contribution < ActiveRecord::Base

end

class User < ActiveRecord::Base
  has_secure_password

end
