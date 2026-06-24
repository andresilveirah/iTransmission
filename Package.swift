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
            url: "https://github.com/andresilveirah/iTransmission/releases/download/main-20260624144227-90f7b4f/iTransmissionFramework.xcframework.zip",
            checksum: "c72dad3476764270dea699ef2a707b64929d4cc60cc6e948695c29c345c24c62"
        )
    ]
)
