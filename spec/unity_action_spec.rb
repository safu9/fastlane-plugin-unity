describe Fastlane::Actions::UnityAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The unity plugin is working!")

      Fastlane::Actions::UnityAction.run(nil)
    end
  end
end
