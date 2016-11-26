# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "rspec-notify-osd"
  gem.version       = "0.3.0"
  gem.authors       = ["Roger Campos", "K.D. Gundermann"]
  gem.email         = ["roger@itnig.net"]
  gem.description   = %q{rspec notifications for notify-osd}
  gem.summary       = %q{rspec notifications for notify-osd}
  gem.homepage      = "https://github.com/rogercampos/rspec-notify-osd"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rspec', '~> 3.0'
end
