# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-config_pit"
  gem.version       = "0.0.1"
  gem.authors       = ["Naoya Ito"]
  gem.email         = ["i.naoya@gmail.com"]
  gem.description   = %q{This plugin provides directive for pit}
  gem.summary       = %q{Fluentd plugin to enable pit in configuration}
  gem.homepage      = "https://github.com/naoay/fluent-plugin-config_pit"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "fluentd"
  gem.add_development_dependency "pit"

  gem.add_runtime_dependency "fluentd"
  gem.add_runtime_dependency "pit"
end
