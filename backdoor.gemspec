# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backdoor/version'

Gem::Specification.new do |gem|
  gem.name          = "backdoor"
  gem.version       = Backdoor::VERSION
  gem.authors       = ["Louis-Alban KIM"]
  gem.email         = ["louis.alban.kim@gmail.com"]
  gem.description   = %q{
    Test your app from end to end: mobile client to backend API.
    backdoor is a simple server that exposes your backend factories (Factory Girl, Machinist) to your API client test suite.
  }
  gem.summary       = %q{Use your backend factories to test your API client (iOS, Android or any other app)}
  gem.homepage      = "http://github.com/lakim/backdoor"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
