require 'spec_helper'

describe Sunspot::MongoMapper do
  class Post
    include MongoMapper::Document
  end

  describe '.find_in_batches' do
    before do
      3.times {|i| Post.create!(:title => "Post #{i}") }
    end

    it 'should yield array of records in order' do
      results = []

      Post.find_in_batches(:batch_size => 2) do |records|
        results << records
      end

      results[0].length.should == 2
      results[1].length.should == 1
    end

    it 'should pass conditions' do
      results = []
      Post.find_in_batches(:title => 'Post 1') do |records|
        results.concat records
      end

      results.size.should == 1
      results.first.title.should == 'Post 1'
    end
  end
end
