// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SiberianPropertyWrappers",
    products: [
        .library(
            name: "SiberianPropertyWrappers",
            targets: ["SiberianPropertyWrappers"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SiberianPropertyWrappers",
            dependencies: []
        ),
    ]
)
