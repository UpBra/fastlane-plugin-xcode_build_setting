lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/xcode_build_setting/version'

Gem::Specification.new do |spec|
	spec.name = 'fastlane-plugin-xcode_build_setting'
	spec.version = Fastlane::XcodeBuildSetting::VERSION
	spec.author = 'UpBra'
	spec.email = 'UpBra@users.noreply.github.com'

	spec.summary = 'Get xcode build setting values'
	# spec.homepage = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-xcode_build_setting"
	spec.license = "MIT"

	spec.files = Dir["lib/**/*"] + %w(README.md LICENSE)
	spec.require_paths = ['lib']
	spec.metadata['rubygems_mfa_required'] = 'true'
	spec.required_ruby_version = '>= 2.6'

	# Don't add a dependency to fastlane or fastlane_re
	# since this would cause a circular dependency

	# spec.add_dependency 'your-dependency', '~> 1.0.0'
end
