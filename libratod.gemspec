# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'libratod/version'

Gem::Specification.new do |spec|
  spec.name          = "libratod"
  spec.version       = Libratod::VERSION
  spec.authors       = ["Michael Gorsuch"]
  spec.email         = ["michael.gorsuch@gmail.com"]
  spec.summary       = 'canary -> librato'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency 'logfmt'
  spec.add_dependency 'librato-metrics'
  spec.add_dependency 'yajl-ruby'
end
