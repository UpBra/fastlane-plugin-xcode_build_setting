require 'fastlane/action'
require_relative '../helper/xcode_build_setting_helper'

module Fastlane

	module Actions

		module SharedValues
			XCODE_BUILD_SETTING_VALUE = :XCODE_BUILD_SETTING_VALUE
		end

		class XcodeBuildSettingAction < Action

			module Key
				PROJECT = :project
				TARGET = :target
				CONFIGURATION = :configuration
				KEY = :key
			end

			def self.run(params)
				FastlaneCore::PrintTable.print_values(
					title: 'Xcode Build Setting',
					config: params
				)

				project = Xcodeproj::Project.open(params[Key::PROJECT])
				UI.user_error!("Failed to find project: #{params[Key::PROJECT]}") if project.nil?
				
				targets = project.targets.select { |t| t.name == params[Key::TARGET] }
				UI.user_error!("Failed to find target: #{params[Key::TARGET]}") if targets.empty?

				configurations = targets.first.build_configurations.select { |c| c.name == params[:configuration] }
				UI.user_error!("Failed to find configuration: #{params[Key::CONFIGURATION]}") if configurations.empty?

				result = configurations.first.build_settings[params[Key::KEY]]
				UI.user_error!("Key #{params[Key::KEY]} does not exist") if result.nil?

				UI.important("#{params[Key::KEY]}: #{result}")

				lane_context[SharedValues::XCODE_BUILD_SETTING_VALUE] = result
			end

			#####################################################
			# @!group Documentation
			#####################################################

			def self.description
				'Get value of xcode build setting'
			end

			def self.available_options
				[
					FastlaneCore::ConfigItem.new(
						key: Key::PROJECT,
						env_name: 'XCODE_BUILD_SETTING_PROJECT',
						description: 'Path to xcode project'
					),
					FastlaneCore::ConfigItem.new(
						key: Key::TARGET,
						env_name: 'XCODE_BUILD_SETTING_TARGET',
						description: 'Name of target'
					),
					FastlaneCore::ConfigItem.new(
						key: Key::CONFIGURATION,
						env_name: 'XCODE_BUILD_SETTING_CONFIGURATION',
						description: 'Name of configuration'
					),
					FastlaneCore::ConfigItem.new(
						key: Key::KEY,
						env_name: 'XCODE_BUILD_SETTING_KEY',
						description: 'Build setting key name'
					)
				]
			end

			def self.output
				[
					['XCODE_BUILD_SETTING_VALUE', 'Value of xcode build setting for target and configuration']
				]
			end

			def self.return_value
				'Value of xcode build setting for target and configuration'
			end

			def self.authors
				['UpBra']
			end

			def self.is_supported?(platform)
				[:ios, :mac].include?(platform)
			end
		end
	end
end
