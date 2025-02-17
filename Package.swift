// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Openhealthcardkit",
    platforms: [
        .iOS(.v13), 
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "HealthCardControl",
            targets: ["HealthCardControl"]),
        .library(
            name: "NFCCardReaderProvider",
            targets: ["NFCCardReaderProvider"]),
        .library(
            name: "HealthCardAccess",
            targets: ["HealthCardAccess"]),
        .library(
            name: "CardReaderProviderApi",
            targets: ["CardReaderProviderApi"]),
        .library(
            name: "Helper",
            targets: ["Helper"]),    
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftCommon/DataKit.git", from: "1.1.0"),
        .package(url: "https://github.com/lsh-silpion/ASN1Kit", from: "1.2.3"),
        .package(url: "https://github.com/gematik/OpenSSL-Swift", from: "4.1.0"),
        .package(url: "https://github.com/gematik/ref-GemCommonsKit", from: "1.3.0"),
    ],
    targets: [
        .target(
            name: "NFCCardReaderProvider",
            dependencies: ["HealthCardAccess", "Helper", .product(name: "GemCommonsKit", package: "ref-GemCommonsKit"), "DataKit"]
        ),
        .target(
            name: "HealthCardControl",
            dependencies: ["HealthCardAccess", "Helper", "OpenSSL-Swift", "DataKit"]
            ),
        .target(
            name: "HealthCardAccess",
            dependencies: ["CardReaderAccess", "CardReaderProviderApi", "ASN1Kit", "DataKit"]
        ),
        .target(
            name: "CardReaderAccess",
            dependencies: ["CardReaderProviderApi", "Helper"]
        ),    
        .target(
            name: "CardReaderProviderApi",
            dependencies: ["Helper", .product(name: "GemCommonsKit", package: "ref-GemCommonsKit")]
        ),   
        .target(
            name: "Helper"
        ),
    ]
)
