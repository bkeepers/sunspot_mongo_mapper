require 'bundler'
Bundler.require :default, :test
require 'sunspot_mongo_mapper'

MongoMapper.database = 'sunspot_mongo_mapper'

RSpec.configure do |config|
  config.before do
    MongoMapper.database.collections.each(&:remove)
  end
end
