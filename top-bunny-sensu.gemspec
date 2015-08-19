# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'top/bunny/sensu/version'

Gem::Specification.new do |spec|
  spec.name          = 'top-bunny-sensu'
  spec.version       = Top::Bunny::Sensu::VERSION
  spec.authors       = ['Lenfree Yeung', 'Rufus Post', 'Ben Kaehne', 'Sebastian Pascu']
  spec.email         = ['lenfree.yeung@gmail.com']
  spec.summary       = 'Write to Sensu queue.'
  spec.description   = 'Write to Sensu queue.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'bundler', '~> 1.5'
  spec.add_dependency 'rake', '~> 10.0'
  spec.add_dependency 'pry'
  spec.add_dependency 'minitest', '~> 4'
  spec.add_dependency 'guard-minitest'
  spec.add_dependency 'guard-rubocop'
  spec.add_dependency 'minitest-reporters'
  spec.add_dependency 'bunny', '~> 2.1.0'
end
