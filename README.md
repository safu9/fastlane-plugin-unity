# unity plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-unity)
[![Gem](https://img.shields.io/gem/v/fastlane-plugin-unity)](https://rubygems.org/gems/fastlane-plugin-unity)
[![Gem](https://img.shields.io/gem/dt/fastlane-plugin-unity)](https://rubygems.org/gems/fastlane-plugin-unity)
[![Test](https://github.com/safu9/fastlane-plugin-unity/workflows/Test/badge.svg)](https://github.com/safu9/fastlane-plugin-unity/actions?query=workflow%3ATest)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-unity`, add it to your project by running:

```bash
fastlane add_plugin unity
```

## About unity

Execute unity in command line from fastlane

```ruby
unity(
    unity_version: "6000.0.43f1",
    build_target: "Android",
    execute_method: "ClassName.MethodName",
    extra_args: "-arg1 -arg2"
)
```

This plugin determine path to Unity executable in the following order

1. `unity_path` option
1. Path used in docker image [gableroux/unity3d](https://gitlab.com/gableroux/unity3d) (only in docker)
1. Default path in Unity Hub with `unity_version` option
1. Default Path of in [install-unity](https://github.com/sttz/install-unity) with `unity_version` option
1. Default path of standalone installation

### Supported options

| Name <br/> Env Var Name                                                    | Description                                      | Default     |
|----------------------------------------------------------------------------|--------------------------------------------------|-------------|
| unity_path <br/> FL_UNITY_PATH                                             | Path to Unity executable                         |             |
| unity_version <br/> FL_UNITY_VERSION                                       | Unity version to execute                         |             |
| project_path <br/> FL_UNITY_PROJECT_PATH                                   | Path to Unity project                            | Current Dir |
| batchmode <br/> FL_UNITY_BATCHMODE                                         | Run command in batch mode                        | true        |
| nographics <br/> FL_UNITY_NOGRAPHICS                                       | Do not initialize the graphics device            | true        |
| quit <br/> FL_UNITY_QUIT                                                   | Quit the Unity after command execution           | true        |
| logfile <br/> FL_UNITY_LOGFILE                                             | Path to output log file                          | - (Console) |
| username <br/> FL_UNITY_USERNAME                                           | Username to log in                               |             |
| password <br/> FL_UNITY_PASSWORD                                           | Password to log in                               |             |
| build_target <br/> FL_UNITY_BUILD_TARGET                                   | Active build target like "iOS" or "Android"      |             |
| execute_method <br/> FL_UNITY_EXECUTE_METHOD                               | Static method to execute                         |             |
| enable_cache_server <br/> FL_UNITY_ENABLE_CACHE_SERVER                     | Enable usage of Accelerator Cache Server         |             |
| cache_server_endpoint <br/> FL_UNITY_CACHE_SERVER_ENDPOINT                 | Endpoint address of Accelerator Cache Server     |             |
| cache_server_namespace_prefix <br/> FL_UNITY_CACHE_SERVER_NAMESPACE_PREFIX | Namespace prefix for Accelerator Cache Server    |             |
| cache_server_enable_download <br/> FL_UNITY_CACHE_SERVER_ENABLE_DOWNLOAD   | Enable downloading from Accelerator Cache Server |             |
| cache_server_enable_upload <br/> FL_UNITY_CACHE_SERVER_ENABLE_UPLOAD       | Enable uploading to Accelerator Cache Server     |             |
| extra_args <br/> FL_UNITY_EXTRA_ARGS                                       | Extra arguments to pass to Unity                 |             |

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
