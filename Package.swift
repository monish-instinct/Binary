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
            targets: ["MyNeuralFramework"]
        )
    ],
    dependencies: [
        // Updated SQLCipher dependency (official version)
        .package(
            url: "https://github.com/stoneburner/SQLCipher.git",
            from: "4.5.0"
        ),
        
        // Razorpay dependency (using their official Swift Package)
        .package(
            url: "https://github.com/razorpay/razorpay-pod.git",
            from: "1.3.0"  // Updated to a more recent version
        )
    ],
    targets: [
        .binaryTarget(
            name: "MyNeuralFramework",
            url: "https://github.com/monish-instinct/Binary/releases/download/binary/MyNeuralFramework.xcframework.zip",
            checksum: "e6fd122c3d086f262f677732fd0eb61614ae06723483bdd7d5046fee8248fbf0"
        ),
        
        .target(
            name: "MyNeuralFramework",
            dependencies: [
                .product(name: "SQLCipher", package: "sqlcipher"),
                .product(name: "razorpay-pod", package: "razorpay-pod")
            ],
            path: "Sources",
            exclude: ["Info.plist"],
            linkerSettings: [
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z")
            ]
        )
    ]
)
