// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "MyNeuralFramework",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "MyNeuralFramework",
            targets: ["MyNeuralFrameworkWrapper"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/stoneburner/SQLCipher.git",
            from: "4.5.0"
        ),
        .package(
            url: "https://github.com/razorpay/razorpay-pod.git",
            from: "1.3.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "MyNeuralFramework",
            url: "https://github.com/monish-instinct/Binary/releases/download/binary/MyNeuralFramework.xcframework.zip",
            checksum: "e6fd122c3d086f262f677732fd0eb61614ae06723483bdd7d5046fee8248fbf0"
        ),
        .target(
            name: "MyNeuralFrameworkWrapper",
            dependencies: [
                .target(name: "MyNeuralFramework"),
                .product(name: "SQLCipher", package: "SQLCipher"),
                .product(name: "Razorpay", package: "razorpay-pod")
            ],
            path: "Sources/Wrapper",
            linkerSettings: [
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
                .linkedFramework("Security")
            ]
        )
    ]
)
