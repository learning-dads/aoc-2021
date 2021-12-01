// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "day1",
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "day1",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms")
            ],
            resources: [.process("input.txt")]
        ),
        .testTarget(
            name: "day1Tests",
            dependencies: ["day1"]),
    ]
)
