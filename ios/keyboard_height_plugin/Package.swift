// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "keyboard_height_plugin",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "keyboard-height-plugin", targets: ["keyboard_height_plugin"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "keyboard_height_plugin",
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
