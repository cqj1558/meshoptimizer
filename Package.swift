// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "meshoptimizer",                // 与仓库同名
    platforms: [
        .iOS(.v13), .macOS(.v11), .tvOS(.v13), .visionOS(.v1)
    ],
    products: [
        // 导出静态库，供其他 Package 依赖
        .library(
            name: "meshoptimizer",
            targets: ["meshoptimizer"]
        )
    ],
    dependencies: [
        // 此仓库无需额外依赖
    ],
    targets: [
        .target(
            name: "meshoptimizer",
            path: ".",                    // 源码根设为仓库根&#8203;:contentReference[oaicite:1]{index=1}
            exclude: [
                "demo", "gltf", "js", "tools",
                ".github", "CMakeLists.txt", "README.md", "LICENSE.md"
            ],
            // 不再指定 `sources`，以自动包含 src/ 下的实现及头文件
            publicHeadersPath: "src",     // 指向 src/ 目录下的所有 .h :contentReference[oaicite:2]{index=2}
            cxxSettings: [
                .unsafeFlags(["-std=c++17"]),    // meshoptimizer 源码需 C++17 
                .headerSearchPath("src")         // 让编译器在 src/ 查找头文件
            ]
        )
    ]
)
