lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/unity/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-unity'
  spec.version       = Fastlane::Unity::VERSION
  spec.author        = 'safu9'
  spec.email         = 'safu9.dev@gmail.com'

  spec.summary       = 'Fastlane plugin for Unity'
  spec.homepage      = 'https://github.com/safu9/fastlane-plugin-unity'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*'] + %w[README.md LICENSE]
  spec.require_paths = ['lib']

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  spec.add_dependency('os', '~> 1.1.0')

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('fastlane', '>= 2.227.0')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rubocop', '>= 1.74.0')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')

  spec.metadata['rubygems_mfa_required'] = 'true'
end
