load("@bazel_skylib//rules:run_binary.bzl", "run_binary")

def picotool_binary_data_header(name, src, out, **kwargs):
    run_binary(
        name = name,
        srcs = [src],
        outs = [out],
        args = [
            "$(location {})".format(src),
            "-o=$(location {})".format(out),
        ],
        tool = "@picotool//bazel:binh",
        **kwargs
    )

def otp_header_parse(name, src, out, **kwargs):
    h_path = out + ".h"
    run_binary(
        name = name + "_json",
        srcs = [src],
        outs = [out, h_path],
        args = [
            "$(location {})".format(src),
            "$(location {})".format(out),
        ],
        tool = "@picotool//otp_header_parser:otp_header_parser",
        **kwargs
    )
