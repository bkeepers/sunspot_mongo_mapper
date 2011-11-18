require 'sunspot'
require 'mongo_mapper'
require 'sunspot/rails'

module Sunspot
  module MongoMapper
    extend ActiveSupport::Concern

    included do
      extend Sunspot::Rails::Searchable::ActsAsMethods
      Sunspot::Adapters::DataAccessor.register DataAccessor, self
      Sunspot::Adapters::InstanceAdapter.register InstanceAdapter, self
    end

    class InstanceAdapter < Sunspot::Adapters::InstanceAdapter
      def id
        @instance.id
      end
    end

    class DataAccessor < Sunspot::Adapters::DataAccessor
      def load(id)
        @class.find(id)
      end

      def load_all(ids)
        @class.find(id)
      end
    end
  end
end
