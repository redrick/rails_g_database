$:.push File.expand_path("../lib", __FILE__)

require "rails-g-database/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails-g-database"
  s.version     = RailsGDatabase::VERSION
  s.authors     = ["redrick"]
  s.email       = ["cheaterblue@gmail.com"]
  s.homepage    = "https://github.com/redrick/rails-g-database"
  s.summary     = "Missing rails database generator and more"
  s.license     = 'MIT'

  s.files = Dir["{lib,test,features,rails_generators}/**/*", "[A-Z]*"]

  s.required_ruby_version     = '>= 1.9.3'

  s.add_dependency "rails" 
end