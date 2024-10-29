// swift-tools-version: 5.5
//
// SPDX-License-Identifier: BSD-3-Clause
// Copyright Contributors to the WebP Codec project

import PackageDescription

let package = Package(
  name: "libwebp",
  products: [
    .library(
      name: "libwebp",
      targets: ["libwebp", "sharpyuv", "imageioutil"]
    ),
    .library(
      name: "WebP",
      targets: ["WebP"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/the-swift-collective/libpng.git", from: "1.6.45")
  ],
  targets: [
    .target(
      name: "libwebp",
      dependencies: [
        .product(name: "LibPNG", package: "libpng")
      ],
      path: "libwebp/src",
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath("../."),
        .define("WEBP_HAVE_PNG", to: "1")
      ]
    ),
    .target(
      name: "imageioutil",
      dependencies: [
        .target(name: "libwebp")
      ],
      path: "libwebp",
      exclude: [
        "cmake",
        "doc",
        "examples",
        "extras",
        "gradle",
        "infra",
        "m4",
        "man",
        "sharpyuv",
        "src",
        "swig",
        "tests",
        "webp_js"
      ],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath("../.")
      ]
    ),
    .target(
      name: "sharpyuv",
      dependencies: [
        .target(name: "libwebp")
      ],
      path: "libwebp",
      exclude: [
        "cmake",
        "doc",
        "examples",
        "extras",
        "gradle",
        "imageio",
        "infra",
        "m4",
        "man",
        "src",
        "swig",
        "tests",
        "webp_js"
      ],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath("../.")
      ]
    ),
    .target(
      name: "WebP",
      dependencies: [
        .target(name: "libwebp"),
        .target(name: "sharpyuv"),
        .target(name: "imageioutil")
      ]
    ),
    .testTarget(
      name: "WebPTests",
      dependencies: ["WebP"]
    ),
  ]
)
