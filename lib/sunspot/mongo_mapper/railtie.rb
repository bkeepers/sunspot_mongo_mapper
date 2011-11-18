require 'rails'

module Sunspot
  module MongoMapper
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "sunspot/mongo_mapper/tasks.rb"
      end
    end
  end
end
