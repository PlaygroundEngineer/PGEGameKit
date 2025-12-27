// swift-tools-version: 5.7
//
// PGEGameKit — a kid-friendly SpriteKit toolkit for Swift Playgrounds App projects.
//
import PackageDescription

let package = Package(
    name: "PGEGameKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "PGEGameKit",
            targets: ["PGEGameKit"]
        )
    ],
    targets: [
        .target(
            name: "PGEGameKit",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
