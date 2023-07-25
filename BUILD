load("@build_bazel_rules_apple//apple:apple.bzl", "local_provisioning_profile")
load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "xcode_provisioning_profile",
)
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("//:ios.bzl", "swift_test")
load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_targets",
    "xcode_schemes",
    "xcodeproj",
)

TEAM_ID = "V82V4GQZXM"
PROFILE_NAME = "iOS Team Provisioning Profile: *"

xcode_provisioning_profile(
    name = "provisioning_profile",
    managed_by_xcode = True,
    provisioning_profile = ":xcode_managed_profile",
    tags = ["manual"],
    visibility = ["//visibility:public"],
)

local_provisioning_profile(
    name = "xcode_managed_profile",
    profile_name = PROFILE_NAME,
    tags = ["manual"],
    team_id = TEAM_ID,
)

swift_library(
    name = "ios_direct",
    srcs = glob(["*.swift"]),
    tags = ["manual"],
)

ios_application(
    name = "TestHostApp",
    testonly = True,
    bundle_id = "io.rules-xcodeproj.demonstration-example",
    families = ["iphone"],
    infoplists = ["Info.plist"],
    minimum_os_version = "13.0",
    provisioning_profile = "//:provisioning_profile",
    tags = [
        "manual",
        "no-remote",
    ],
    visibility = ["//visibility:public"],
    deps = [":ios_main"],
)

swift_library(
    name = "ios_main",
    srcs = ["AppDelegate.swift"],
    tags = ["manual"],
)

swift_test(
    name = "run_tests",
    srcs = ["ExampleTests.swift"],
    use_test_host = True,
    visibility = ["//visibility:public"],
)

xcodeproj(
    name = "xcodeproj",
    bazel_path = "bazel",
    build_mode = "bazel",
    default_xcode_configuration = "Debug",
    project_name = "DemonstrationProject",
    schemes = [
        xcode_schemes.scheme(
            name = "iOS App",
            launch_action = xcode_schemes.launch_action(":TestHostApp"),
        ),
        xcode_schemes.scheme(
            name = "Tests",
            test_action = xcode_schemes.test_action([
                ":run_tests",
            ]),
        ),
    ],
    tags = ["manual"],
    top_level_targets = [
        # Apps
        top_level_targets(
            labels = [
                ":TestHostApp",
                ":run_tests",
            ],
            target_environments = [
                "device",
                "simulator",
            ],
        ),
    ],
    xcode_configurations = {
        "Debug": {
            "//command_line_option:compilation_mode": "dbg",
            "//command_line_option:features": [],
        },
        "Release": {
            "//command_line_option:compilation_mode": "opt",
            "//command_line_option:features": ["swift.enable_testing"],
        },
    },
)
