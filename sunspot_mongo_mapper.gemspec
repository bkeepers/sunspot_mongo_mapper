# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'sunspot_mongo_mapper'
  s.version     = '0.1.1'
  s.authors     = ['Brandon Keepers']
  s.email       = ['brandon@opensoul.org']
  s.homepage    = "https://github.com/bkeepers/sunspot_mongo_mapper"
  s.summary     = %q{A Sunspot wrapper for MongoMapper.}
  s.description = %q{A Sunspot wrapper for MongoMapper.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'mongo_mapper'
  s.add_runtime_dependency 'sunspot',       '~> 2.0'
  s.add_runtime_dependency 'sunspot_rails', '~> 2.0'
  s.add_runtime_dependency 'rails',         '~> 3.2'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end
