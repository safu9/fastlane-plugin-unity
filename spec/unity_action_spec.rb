describe Fastlane::Actions::UnityAction do
  describe '#run' do
    it 'run with unity_path' do
      expect(FastlaneCore::CommandExecutor).to receive(:execute).with(
        command: '"/path/to/unity"',
        print_all: true,
        print_command: true
      )

      Fastlane::Actions::UnityAction.run(
        {
          unity_path: '/path/to/unity'
        }
      )
    end

    it 'run without unity_path' do
      allow(Fastlane::Helper::UnityHelper).to receive(:find_unity_path).and_return('/path/to/found/unity')

      expect(FastlaneCore::CommandExecutor).to receive(:execute).with(
        command: '"/path/to/found/unity"',
        print_all: true,
        print_command: true
      )

      Fastlane::Actions::UnityAction.run({})
    end

    it 'run with args' do
      expect(FastlaneCore::CommandExecutor).to receive(:execute).with(
        command: '"/path/to/unity" -projectPath "/path/to/project" -logfile - -extra',
        print_all: true,
        print_command: true
      )

      Fastlane::Actions::UnityAction.run(
        {
          unity_path: '/path/to/unity',
          project_path: '/path/to/project',
          logfile: '-',
          extra_args: '-extra'
        }
      )
    end
  end
end
