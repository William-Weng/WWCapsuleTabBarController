// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWCapsuleTabBarController",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWCapsuleTabBarController", targets: ["WWCapsuleTabBarController"]),
    ],
    dependencies: [
        .package(url: "https://github.com/William-Weng/WWPrint", from: "1.3.0"),
    ],
    targets: [
        .target(name: "WWCapsuleTabBarController", dependencies: ["WWPrint"], resources: [.process("Xib")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
