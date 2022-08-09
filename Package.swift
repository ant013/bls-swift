// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "bls-swift",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v9), .watchOS(.v7)],
  products: [
    .library(name: "bls-swift",
             targets: ["bls_framework"])
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "bls-swift",
      dependencies: ["bls_framework"],
      path: "bls_framework/Sources",
      exclude: [
        "bls",
        "mcl"
      ]
    ),
    .binaryTarget(
       name: "bls_framework",
       url: "https://github.com/ant013/bls-swift/releases/download/1.0.0/bls_framework.xcframework.zip",
       checksum: "152ffef41d29814acaa3ed9fbea1155cb454762c116b327c4251e922fa7210da"
    )
  ]
)
