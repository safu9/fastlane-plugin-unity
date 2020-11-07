# unity plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-unity)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-unity`, add it to your project by running:

```bash
fastlane add_plugin unity
```

## About unity

Execute unity in command line from fastlane

```ruby
unity(
    build_target: "Android",
    execute_method: "ClassName.MethodName",
    extra_args: "-arg1 -arg2"
)
```

This plugin determine path to Unity executable in the following order

1. `unity_path` option
1. Path used in [Unity docker image](https://gitlab.com/gableroux/unity3d)
1. Default path in Unity Hub with `unity_version` option
1. Default path of standalone installation

### Supported options

| Name           | Description                                 | Default     | Env Var Name            |
|----------------|---------------------------------------------|-------------|-------------------------|
| unity_path     | Path to Unity executable                    |             | FL_UNITY_PATH           |
| unity_version  | Unity version to execute                    |             | FL_UNITY_VERSION        |
| project_path   | Path to Unity project                       | Current Dir | FL_UNITY_PROJECT_PATH   |
| batchmode      | Run command in batch mode                   | true        | FL_UNITY_BATCHMODE      |
| nographics     | Do not initialize the graphics device       | true        | FL_UNITY_NOGRAPHICS     |
| quit           | Quit the Unity after command execution      | true        | FL_UNITY_QUIT           |
| username       | Username to log in                          |             | FL_UNITY_USERNAME       |
| password       | Password to log in                          |             | FL_UNITY_PASSWORD       |
| build_target   | Active build target like "iOS" or "Android" |             | FL_UNITY_BUILD_TARGET   |
| execute_method | Static method to execute                    |             | FL_UNITY_EXECUTE_METHOD |
| extra_args     | Extra arguments                             |             | FL_UNITY_EXTRA_ARGS     |

See manual for detailed descriptions and other options: https://docs.unity3d.com/Manual/CommandLineArguments.html

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
