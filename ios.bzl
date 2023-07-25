
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_unit_test")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

def swift_test(name, srcs, data = [], deps = [], tags = [], use_test_host = False, visibility = []):
    test_lib_name = name + "_lib"
    swift_library(
        name = test_lib_name,
        srcs = srcs,
        data = data,
        deps = deps,
        linkopts = ["-lresolv.9"],
        testonly = True,
        visibility = ["//visibility:private"],
    )

    test_host = None
    if use_test_host:
        test_host = "//:TestHostApp"

    ios_unit_test(
        name = name,
        data = data,
        deps = [test_lib_name],
        minimum_os_version = "13.0",
        timeout = "long",
        test_host = test_host,
        visibility = visibility,
    )
