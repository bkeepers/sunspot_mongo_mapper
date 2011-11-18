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
        @clazz.first(:id => id)
      end

      def load_all(ids)
        @clazz.all(:id.in => ids)
      end
    end

    module ClassMethods
      def find_in_batches(options = {}, &block)
        batch_size = options.delete(:batch_size) || 1000
        start      = options.delete(:start) || 0
        options.delete(:include)
        records    = []

        query(options).skip(start).order(:id.asc).each do |record|
          records << record
          if records.size == batch_size
            yield records
            records = []
          end
        end

        yield records unless records.blank?
      end
    end
  end
end
