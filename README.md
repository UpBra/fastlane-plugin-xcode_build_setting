# xcode_build_setting plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-xcode_build_setting)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-xcode_build_setting`, add it to your project by running:

```bash
fastlane add_plugin xcode_build_setting
```

## About xcode_build_setting

Get xcode build setting value in a project for a given target and configuration.

## Example

```ruby
xcode_build_setting(
	project: 'Example.xcodeproj',
	target: 'Example',
	configuration: 'Debug',
	key: 'MY_USER_DEFINED_SETTING'
)

# Access the value from the lane_context
result = lane_context[SharedValues::XCODE_BUILD_SETTING_VALUE]
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
