load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_apple_support",
    sha256 = "34bab0182c33ef595015eb0e66518ef09b367a7841cdba997c6c01843b62f753",
    url = "https://github.com/bazelbuild/apple_support/releases/download/1.8.0/apple_support.1.8.0.tar.gz",
)

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "8ac4c7997d863f3c4347ba996e831b5ec8f7af885ee8d4fe36f1c3c8f0092b2c",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/2.5.0/rules_apple.2.5.0.tar.gz",
)

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "b3b6c5c9f2a589150f71e79dec1e1ed0eb974dbd49e9317df4e09e08ff6e83df",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.9.1/rules_swift.1.9.1.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

http_archive(
    name = "rules_xcodeproj",
    sha256 = "24aed0bc6cf4132f62e08d4b81656107ea8d7804c9f7f57cfb9acbd0992ba75b",
    url = "https://github.com/MobileNativeFoundation/rules_xcodeproj/releases/download/1.8.1/release.tar.gz",
)

load(
    "@rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

load(
    "@build_bazel_rules_apple//apple:apple.bzl",
    "provisioning_profile_repository",
)

provisioning_profile_repository(
    name = "local_provisioning_profiles",
)

apple_support_dependencies()

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()
