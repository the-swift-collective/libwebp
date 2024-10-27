<!-- markdownlint-configure-file {
  "MD013": {
    "code_blocks": false,
    "tables": false
  },
  "MD033": false,
  "MD041": false
} -->

<div align="center">

<h1 align="center">
    WebP
</h1>

<p align="center">
  <i align="center">Cross platform <b>swift</b> package for the <a href="https://github.com/webmproject/libwebp"><b>libwebp library</b></a>.</i>
</p>

</div>

<h4 align="center">
  <a href="https://github.com/the-swift-collective/webp/actions/workflows/swift-ubuntu.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/the-swift-collective/webp/swift-ubuntu.yml?style=flat-square&label=ubuntu%20&labelColor=E95420&logoColor=FFFFFF&logo=ubuntu">
  </a>
  <a href="https://github.com/the-swift-collective/webp/actions/workflows/swift-macos.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/the-swift-collective/webp/swift-macos.yml?style=flat-square&label=macOS&labelColor=000000&logo=apple">
  </a>
  <a href="https://github.com/the-swift-collective/webp/actions/workflows/swift-windows.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/the-swift-collective/webp/swift-windows.yml?style=flat-square&label=windows&labelColor=357EC7&logo=gitforwindows">
  </a>
</h4>

<div align="center">

### Usage

</div>

##### To use webp in swift, add webp as a package dependency in your project's Package.swift file.
```swift
dependencies: [
  .package(url: "https://github.com/the-swift-collective/webp.git", from: "1.4.0"),
]
```


##### Then, for any target you'd like, add the webp product as a target dependency, a complete example.
```swift
// swift-tools-version: 5.8
import PackageDescription

let package = Package(
  name: "MyPackage",
  products: [
    .library(
      name: "MyLibrary",
      targets: ["MyLibrary"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/the-swift-collective/webp.git", from: "1.4.0")
  ],
  targets: [
    .target(
      name: "MyLibrary",
      dependencies: [
        /* add the webp product as a library dependency. */
        .product(name: "WebP", package: "webp"),
      ]
    ),
  ]
)
```

<br>

<hr/>

###### ***the swift collective** - cross platform **swift packages**.*
###### webp is licensed under the terms of the [BSD 3-Clause "New" or "Revised" License](https://www.webmproject.org/license/software/).
