// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NeumorphismTab",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "NeumorphismTab",
            targets: ["NeumorphismTab"]),
    ],
    targets: [
        .target(
            name: "NeumorphismTab",
            dependencies: [],
            path: "NeumorphismTab/Sources"),
    ]
)
