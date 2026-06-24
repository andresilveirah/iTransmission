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
            url: "https://github.com/andresilveirah/iTransmission/releases/download/1.0.1/iTransmissionFramework.xcframework.zip",
            checksum: "9e81c757e4d6cc8770d4a85437ff82d169d5b8fc38be59d07c5336f6441aa45c"
        )
    ]
)
