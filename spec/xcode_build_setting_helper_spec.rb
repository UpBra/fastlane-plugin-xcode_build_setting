describe Fastlane::Helper::XcodeBuildSettingHelper do
	describe '#show_message' do
		it 'prints a message' do
			expect(Fastlane::UI).to receive(:message).with("Hello from the xcode_build_setting plugin helper!")

			Fastlane::Helper::XcodeBuildSettingHelper.show_message
		end
	end
end
