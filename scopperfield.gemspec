# -*- encoding: utf-8 -*-
require File.expand_path('../lib/scopperfield/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mikhail Dieterle"]
  gem.email         = ["MikDiet@gmail.com"]
  gem.description   = %q{Scopes magic}
  gem.summary       = %q{Scopes magic}
  gem.homepage      = "https://github.com/Mik-die/scopperfield"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "scopperfield"
  gem.require_paths = ["lib"]
  gem.version       = Scopperfield::VERSION

  gem.add_dependency "rails", "~> 3.2.0"

  gem.add_development_dependency "redcarpet", "~> 1.17"
  gem.add_development_dependency "yard", "~> 0.7.5"
  gem.add_development_dependency "rspec-rails"
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "factory_girl_rails"
  gem.add_development_dependency "database_cleaner"
end
