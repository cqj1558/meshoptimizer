// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "meshoptimizer",                                // 包名，与仓库同名
    platforms: [
        .iOS(.v13), .macOS(.v11), .tvOS(.v13), .visionOS(.v1)
    ],
    products: [
        // 导出一个名为 "meshoptimizer" 的静态库，供其它 Package 依赖
        .library(
            name: "meshoptimizer",
            targets: ["meshoptimizer"]
        )
    ],
    dependencies: [
        // 无外部依赖
    ],
    targets: [
        .target(
            name: "meshoptimizer",
            // 源码根目录就是仓库根
            path: ".",
            // 排除示例、测试及构建脚本目录
            exclude: [
                "demo",
                "gltfpack",
                "tests",
                "cmake",
                "README.md",
                "LICENSE.md"
            ],
            // 仅把 src 文件夹作为编译单元
            sources: ["src"],
            // C++ 头文件在 include/meshoptimizer
            publicHeadersPath: "include",
            cxxSettings: [
                // 告诉编译器去 include 目录下找头
                .headerSearchPath("include"),
                // 使用 C++17 标准
                .unsafeFlags(["-std=c++17"])
            ]
        )
    ]
)
