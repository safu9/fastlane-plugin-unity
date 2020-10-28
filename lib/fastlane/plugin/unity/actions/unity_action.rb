require 'fastlane/action'
require_relative '../helper/unity_helper'

module Fastlane
  module Actions
    class UnityAction < Action
      def self.run(params)
        build_cmd = "#{params[:unty_path]}"
        build_cmd << " -projectPath \"#{params[:project_path]}\"" if params[:project_path]
        build_cmd << " -batchmode" if params[:batchmode]
        build_cmd << " -nographics" if params[:nographics]
        build_cmd << " -quit" if params[:quit]
        build_cmd << " -executeMethod \"#{params[:execute_method]}\"" if params[:execute_method]
        build_cmd << " -logfile"

        UI.message ""
        UI.message Terminal::Table.new(
          title: "Unity".green,
          headings: ["Option", "Value"],
          rows: params.values
        )
        UI.message ""

        UI.message "Start running"
        UI.message ""

        sh build_cmd

        UI.success "Finished"
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
          FastlaneCore::ConfigItem.new(key: :unty_path,
                                       env_name: "FL_UNITY_PATH",
                                       description: "Path to Unity executable"
                                       type: String),

          FastlaneCore::ConfigItem.new(key: :project_path,
                                       env_name: "FL_UNITY_PROJECT_PATH",
                                       description: "Path to Unity project",
                                       default_value: "#{Dir.pwd}",
                                       optional: true,
                                       type: String),

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

          FastlaneCore::ConfigItem.new(key: :execute_method,
                                       env_name: "FL_UNITY_EXECUTE_METHOD",
                                       description: "Static method to execute",
                                       optional: true,
                                       type: String),
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
