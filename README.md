# sunspot_mongo_mapper

A Sunspot wrapper for MongoMapper.

## Install

Add the gem to your Gemfile

```ruby
gem 'sunspot_mongo_mapper'
```

## Usage

```ruby
class Post
  include MongoMapper::Document

  key :title

  searchable do
    text :title
  end
end
```

## Links

* [sunspot](http://github.com/sunspot/sunspot)

## Credits

This gem  was adapted from [sunspot_mongoid](https://github.com/jugyo/sunspot_mongoid)
