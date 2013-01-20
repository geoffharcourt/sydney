# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sydney/version'

Gem::Specification.new do |gem|
  gem.name          = "sydney"
  gem.version       = Sydney::VERSION
  gem.authors       = ["Geoff Harcourt"]
  gem.email         = ["geoff.harcourt@gmail.com"]
  gem.description   = %q{A Treetop parser for alias files}
  gem.summary       = %q{Sydney parses alias files, dividing them into sections and alias entries, tying comments to entries.}
  gem.homepage      = "http://github.com/geoffharcourt/sydney"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'treetop', '~> 1.4.12'

  gem.add_development_dependency 'rspec', '~> 2.12'
end