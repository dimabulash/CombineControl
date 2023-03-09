// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "CombineControl",
    platforms: [.iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "CombineControl",
            targets: ["CombineControl"]),
    ],
    dependencies: [],
    targets: [.target(name: "CombineControl",
                      dependencies: [],
                      path: "Sources")]
)
