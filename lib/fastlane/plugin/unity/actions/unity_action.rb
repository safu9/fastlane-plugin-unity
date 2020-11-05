require 'fastlane/action'
require_relative '../helper/unity_helper'

module Fastlane
  module Actions
    class UnityAction < Action
      def self.run(params)
        unity_path = params[:unity_path]
        unity_path = Helper::UnityHelper.find_unity_path(params[:unity_version]) unless unity_path
        unless unity_path
          UI.user_error!("Cannot find path to unity executable!")
        end

        cmd = "\"#{unity_path}\""
        cmd << " -projectPath \"#{params[:project_path]}\"" if params[:project_path]
        cmd << " -batchmode" if params[:batchmode]
        cmd << " -nographics" if params[:nographics]
        cmd << " -quit" if params[:quit]
        cmd << " -username #{params[:username]}" if params[:username]
        cmd << " -password #{params[:password]}" if params[:password]
        cmd << " -executeMethod #{params[:execute_method]}" if params[:execute_method]
        cmd << " -logfile"

        FastlaneCore::CommandExecutor.execute(
          command: cmd,
          print_all: true,
          print_command: true
        )
      end

      def self.description
        "Fastlane plugin for Unity"
      end

      def self.authors
        ["safu9"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Fastlane plugin for Unity. Easily run Unity to build, test and execute method from fastlane."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :unity_path,
                                       env_name: "FL_UNITY_PATH",
                                       description: "Path to Unity executable",
                                       optional: true),

          FastlaneCore::ConfigItem.new(key: :unity_version,
                                       env_name: "FL_UNITY_VERSION",
                                       description: "Unity version to execute",
                                       optional: true),

          FastlaneCore::ConfigItem.new(key: :project_path,
                                       env_name: "FL_UNITY_PROJECT_PATH",
                                       description: "Path to Unity project",
                                       default_value: Dir.pwd,
                                       optional: true),

          FastlaneCore::ConfigItem.new(key: :batchmode,
                                       env_name: "FL_UNITY_BATCHMODE",
                                       description: "Run command in batch mode",
                                       default_value: false,
                                       is_string: false),

          FastlaneCore::ConfigItem.new(key: :nographics,
                                       env_name: "FL_UNITY_NOGRAPHICS",
                                       description: "Do not initialize the graphics device",
                                       default_value: false,
                                       is_string: false),

          FastlaneCore::ConfigItem.new(key: :quit,
                                       env_name: "FL_UNITY_QUIT",
                                       description: "Quit the Unity after command execution",
                                       default_value: false,
                                       is_string: false),

          FastlaneCore::ConfigItem.new(key: :username,
                                       env_name: "FL_UNITY_USERNAME",
                                       description: "Username to log in",
                                       optional: true),

          FastlaneCore::ConfigItem.new(key: :password,
                                       env_name: "FL_UNITY_PASSWORD",
                                       description: "Password to log in",
                                       optional: true),

          FastlaneCore::ConfigItem.new(key: :execute_method,
                                       env_name: "FL_UNITY_EXECUTE_METHOD",
                                       description: "Static method to execute",
                                       optional: true)
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
