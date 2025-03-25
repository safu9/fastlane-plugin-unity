require 'fastlane/action'
require_relative '../helper/unity_helper'

module Fastlane
  module Actions
    class UnityAction < Action
      def self.run(params)
        unity_path = params[:unity_path]
        unity_path ||= Helper::UnityHelper.find_unity_path(params[:unity_version])
        UI.user_error!('Cannot find path to unity executable!') unless unity_path

        cmd = "\"#{unity_path}\""
        cmd << " -projectPath \"#{params[:project_path]}\"" if params[:project_path]
        cmd << ' -batchmode' if params[:batchmode]
        cmd << ' -nographics' if params[:nographics]
        cmd << ' -quit' if params[:quit]

        cmd << ' -logfile -' if params[:logfile] == '-'
        cmd << " -logfile \"#{params[:logfile]}\"" if params[:logfile] && params[:logfile] != '-'

        cmd << " -username #{params[:username]}" if params[:username]
        cmd << " -password #{params[:password]}" if params[:password]

        cmd << " -buildTarget #{params[:build_target]}" if params[:build_target]
        cmd << " -executeMethod #{params[:execute_method]}" if params[:execute_method]

        cmd << ' -adb2 -EnableCacheServer' if params[:enable_cache_server]
        cmd << " -cacheServerEndpoint #{params[:cache_server_endpoint]}" if params[:cache_server_endpoint]
        cmd << " -cacheServerNamespacePrefix #{params[:cache_server_namespace_prefix]}" if params[:cache_server_namespace_prefix]
        cmd << " -cacheServerEnableDownload #{params[:cache_server_enable_download]}" unless params[:cache_server_enable_download].nil?
        cmd << " -cacheServerEnableUpload #{params[:cache_server_enable_upload]}" unless params[:cache_server_enable_upload].nil?

        cmd << " #{params[:extra_args]}" if params[:extra_args]

        FastlaneCore::CommandExecutor.execute(
          command: cmd,
          print_all: true,
          print_command: true
        )
      end

      def self.description
        'Fastlane plugin for Unity'
      end

      def self.authors
        ['safu9']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        'Fastlane plugin for Unity. Easily run Unity to build, test and execute method from fastlane.'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :unity_path,
            env_name: 'FL_UNITY_PATH',
            description: 'Path to Unity executable',
            optional: true,
            conflicting_options: [:unity_version]
          ),

          FastlaneCore::ConfigItem.new(
            key: :unity_version,
            env_name: 'FL_UNITY_VERSION',
            description: 'Unity version to execute',
            optional: true,
            conflicting_options: [:unity_path]
          ),

          FastlaneCore::ConfigItem.new(
            key: :project_path,
            env_name: 'FL_UNITY_PROJECT_PATH',
            description: 'Path to Unity project',
            default_value: Dir.pwd,
            optional: true
          ),

          FastlaneCore::ConfigItem.new(
            key: :batchmode,
            env_name: 'FL_UNITY_BATCHMODE',
            description: 'Run command in batch mode',
            default_value: true,
            is_string: false
          ),

          FastlaneCore::ConfigItem.new(
            key: :nographics,
            env_name: 'FL_UNITY_NOGRAPHICS',
            description: 'Do not initialize the graphics device',
            default_value: true,
            is_string: false
          ),

          FastlaneCore::ConfigItem.new(
            key: :quit,
            env_name: 'FL_UNITY_QUIT',
            description: 'Quit the Unity after command execution',
            default_value: true,
            is_string: false
          ),

          FastlaneCore::ConfigItem.new(
            key: :logfile,
            env_name: 'FL_UNITY_LOGFILE',
            description: 'Path to output log file (Default is console)',
            optional: true,
            default_value: '-'
          ),

          FastlaneCore::ConfigItem.new(
            key: :username,
            env_name: 'FL_UNITY_USERNAME',
            description: 'Username to log in',
            optional: true
          ),

          FastlaneCore::ConfigItem.new(
            key: :password,
            env_name: 'FL_UNITY_PASSWORD',
            description: 'Password to log in',
            optional: true
          ),

          FastlaneCore::ConfigItem.new(
            key: :build_target,
            env_name: 'FL_UNITY_BUILD_TARGET',
            description: 'Active build target',
            optional: true
          ),

          FastlaneCore::ConfigItem.new(
            key: :execute_method,
            env_name: 'FL_UNITY_EXECUTE_METHOD',
            description: 'Static method to execute',
            optional: true
          ),

          FastlaneCore::ConfigItem.new(
            key: :enable_cache_server,
            env_name: 'FL_UNITY_ENABLE_CACHE_SERVER',
            description: 'Enable usage of Accelerator Cache Server',
            default_value: false,
            is_string: false
          ),

          FastlaneCore::ConfigItem.new(
            key: :cache_server_endpoint,
            env_name: 'FL_UNITY_CACHE_SERVER_ENDPOINT',
            description: 'Endpoint address of Accelerator Cache Server',
            optional: true
          ),

          FastlaneCore::ConfigItem.new(
            key: :cache_server_namespace_prefix,
            env_name: 'FL_UNITY_CACHE_SERVER_NAMESPACE_PREFIX',
            description: 'Namespace prefix for Accelerator Cache Server',
            optional: true
          ),

          FastlaneCore::ConfigItem.new(
            key: :cache_server_enable_download,
            env_name: 'FL_UNITY_CACHE_SERVER_ENABLE_DOWNLOAD',
            description: 'Enable downloading from Accelerator Cache Server',
            optional: true,
            default_value: nil,
            is_string: false
          ),

          FastlaneCore::ConfigItem.new(
            key: :cache_server_enable_upload,
            env_name: 'FL_UNITY_CACHE_SERVER_ENABLE_UPLOAD',
            description: 'Enable uploading to Accelerator Cache Server',
            optional: true,
            default_value: nil,
            is_string: false
          ),

          FastlaneCore::ConfigItem.new(
            key: :extra_args,
            env_name: 'FL_UNITY_EXTRA_ARGS',
            description: 'Extra arguments',
            optional: true
          )
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
