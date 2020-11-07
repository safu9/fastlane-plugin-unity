require 'fastlane_core/ui/ui'
require 'os'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class UnityHelper
      # class methods that you define here become available in your action
      # as `Helper::UnityHelper.your_method`
      #

      def self.find_unity_path(unity_version)
        paths = []

        if OS::Underlying.docker?
          # See: https://gitlab.com/gableroux/unity3d
          paths << "/opt/Unity/Editor/Unity"
        end

        if OS.windows?
          paths << "C:\\Program Files\\Unity\\Hub\\Editor\\#{unity_version}\\Editor\\Unity.exe" if unity_version
          paths << "C:\\Program Files\\Unity\\Editor\\Unity.exe"
        elsif OS.mac?
          paths << "/Applications/Unity/Hub/Editor/#{unity_version}/Unity.app/Contents/MacOS/Unity" if unity_version
          paths << "/Applications/Unity/Unity.app/Contents/MacOS/Unity"
        elsif OS.linux?
          paths << "~/Unity/Hub/Editor/#{unity_version}/Editor/Unity" if unity_version
        end

        return paths.find { |path| File.exist?(path) }
      end
    end
  end
end
