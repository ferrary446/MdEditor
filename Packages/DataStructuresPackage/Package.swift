// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataStructuresPackage",
    products: [
        .library(
            name: "DataStructuresPackage",
            targets: ["DataStructuresPackage"]
        )
    ],
    targets: [
        .target(
            name: "DataStructuresPackage"
        ),
        .testTarget(
            name: "DataStructuresPackageTests",
            dependencies: ["DataStructuresPackage"]
        )
    ]
)
