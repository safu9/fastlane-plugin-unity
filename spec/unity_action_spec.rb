describe Fastlane::Actions::UnityAction do
  describe '#run' do
    it 'exec a command' do
      expect(FastlaneCore::CommandExecutor).to receive(:execute).with(
        command: "\"/path/to/unity\" -logfile",
        print_all: true,
        print_command: true
      )

      Fastlane::Actions::UnityAction.run({ unity_path: '/path/to/unity' })
    end

    it 'exec a command without unity_path' do
      allow(Fastlane::Helper::UnityHelper).to receive(:find_unity_path).and_return("/path/to/found/unity")

      expect(FastlaneCore::CommandExecutor).to receive(:execute).with(
        command: "\"/path/to/found/unity\" -logfile",
        print_all: true,
        print_command: true
      )

      Fastlane::Actions::UnityAction.run({})
    end
  end
end
