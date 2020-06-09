
java_binary(
    name = "echo_client",
    srcs = ["EchoClient.java"],
    main_class = "EchoClient",
    runtime_deps = [
        "@io_grpc_grpc_java//netty", 
    ],
    deps = [
    #   ":transmission_object_java",
        "//proto:transmission_object_java_proto",
        "//proto:transceiver_java_proto", 
        "//proto:transceiver_java_proto_grpc",
        "//third_party:gson",
        "@io_grpc_grpc_java//api",
    ],
)

java_library(
    name = "transmission_object_java", 
    srcs = ["TransmissionObject.java"],
)
