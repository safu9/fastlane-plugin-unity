require 'fastlane/action'
require_relative '../helper/unity_helper'

module Fastlane
  module Actions
    class UnityAction < Action
      def self.run(params)
        UI.message("The unity plugin is working!")
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
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "UNITY_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
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
