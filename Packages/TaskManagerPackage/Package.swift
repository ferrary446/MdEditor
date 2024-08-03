// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TaskManagerPackage",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "TaskManagerPackage",
            targets: ["TaskManagerPackage"]
        )
    ],
    targets: [
        .target(
            name: "TaskManagerPackage"
        ),
        .testTarget(
            name: "TaskManagerPackageTests",
            dependencies: ["TaskManagerPackage"]
        )
    ]
)
