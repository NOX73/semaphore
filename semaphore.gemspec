# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'semaphore/version'

Gem::Specification.new do |gem|
  gem.name          = "semaphore"
  gem.version       = Semaphore::VERSION
  gem.authors       = ["Rozhnov Alexandr"]
  gem.email         = ["nox73@ya.ru"]
  gem.description   = %q{Simple Semaphore implementation in Ruby}
  gem.summary       = %q{Semaphore Ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('rake')
  gem.add_development_dependency('minitest')
  gem.add_development_dependency('turn')
end
