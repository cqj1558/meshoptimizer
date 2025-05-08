// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "meshoptimizer",
    products: [.library(name: "meshoptimizer", targets: ["meshoptimizer"])],
    targets: [.target(name: "meshoptimizer", path: "src")],
    cxxLanguageStandard: .cxx17
)
