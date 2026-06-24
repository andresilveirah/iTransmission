// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "iTransmission",
    products: [
        .library(
            name: "iTransmissionBinary",
            targets: ["iTransmissionFramework"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "iTransmissionFramework",
            url: "https://github.com/andresilveirah/iTransmission/releases/download/1.0.2/iTransmissionFramework.xcframework.zip",
            checksum: "a2902b007eaeeff10471c4373fadaa66503b15cee8ecd3339921e7685620272c"
        )
    ]
)
