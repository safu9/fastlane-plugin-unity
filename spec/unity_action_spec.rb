describe Fastlane::Actions::UnityAction do
  describe '#run' do
    it 'exec a command' do
      expect(FastlaneCore::CommandExecutor).to receive(:execute).with(
        command: "/path/to/unity -logfile",
        print_all: true,
        print_command: true
      )

      Fastlane::Actions::UnityAction.run({ unity_path: '/path/to/unity' })
    end
  end
end
