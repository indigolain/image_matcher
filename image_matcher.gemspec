# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_matcher/version'

ImageMatcher::DESCRIPTION = 'Tells if two images match each other.'

Gem::Specification.new do |spec|
  spec.name          = 'image_matcher'
  spec.version       = ImageMatcher::VERSION
  spec.authors       = ['indigolain']
  spec.email         = ['indigo.lain@gmail.com']

  spec.summary       = ImageMatcher::DESCRIPTION
  spec.description   = ImageMatcher::DESCRIPTION
  spec.homepage      = 'https://github.com/indigolain/image_matcher'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'

  spec.add_runtime_dependency 'rmagick', '>= 2.13.4'
end
