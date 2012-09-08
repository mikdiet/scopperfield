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
end
