package(default_visibility = ["//visibility:public"])

load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
    name = "transmission_object_proto",
    srcs = ["transmission_object.proto"], 
)

java_proto_library(
    name = "transmission_object_java_proto", 
    deps = [":transmission_object_proto"],
)

load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library") 
go_proto_library(
    name = "transmission_object_go_proto", 
    proto = ":transmission_object_proto", 
    importpath = "transmission_object"
)

proto_library(
    name = "transceiver_proto", 
    srcs = ["transceiver.proto"], 
    deps = [
        ":transmission_object_proto", 
    ]
)

go_proto_library(
    name = "transceiver_go_proto_grpc",
    compiler = "@io_bazel_rules_go//proto:go_grpc", 
    proto = ":transceiver_proto",
    importpath = "transceiver",
    deps = [
        ":transmission_object_go_proto",
    ],
    visibility = ["//go:__pkg__"], 
)

java_proto_library(
    name = "transceiver_java_proto",
    deps = [":transceiver_proto"],
    visibility = ["//java:__subpackages__"],
)

load("@io_grpc_grpc_java//:java_grpc_library.bzl", "java_grpc_library")
java_grpc_library(
    name = "transceiver_java_proto_grpc",
    srcs = [":transceiver_proto"],
    deps = [":transceiver_java_proto"],
    visibility = ["//java:__subpackages__"],
)
