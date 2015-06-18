# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n_model_translator/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n_model_translator"
  spec.version       = I18nModelTranslator::VERSION
  spec.authors       = ["Jens Freiling"]
  spec.email         = ["jcfrei@uni-koblenz.de"]
  spec.summary       = %q{Generate I18n Model Translation Files}
  spec.description   = %q{Generate I18n Active Record Model Translation Files}
  spec.homepage      = "https://github.com/botularius/i18n_model_translator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '~> 4.0'
  spec.add_dependency 'i18n'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'sqlite3', '~> 0'
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
end
