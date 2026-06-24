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
            url: "https://github.com/andresilveirah/iTransmission/releases/download/1.0.0/iTransmissionFramework.xcframework.zip",
            checksum: "a00ba39036bd20a42151b75979a6d426752597dd0268fbe90bdab5180c6fd353"
        )
    ]
)
