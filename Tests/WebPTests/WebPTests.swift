// SPDX-License-Identifier: BSD-3-Clause
// Copyright Contributors to the WebP Codec project

import XCTest

@testable import WebP

class WebPTests: XCTestCase {
  func testWebPVersion() throws {
    print("")
    print("webp version info")
    print("-----------------")
    print(" decoder: v\(unpackVersion(WebPGetDecoderVersion()))")
    print("   demux: v\(unpackVersion(WebPGetDemuxVersion()))")
    print(" encoder: v\(unpackVersion(WebPGetEncoderVersion()))")
    print("     mux: v\(unpackVersion(WebPGetMuxVersion()))")
    print("sharpyuv: v\(unpackSharpYUVVersion(SharpYuvGetVersion()))")
    print("")
  }

  func unpackVersion(_ packedVersion: Int32) -> String {
    let major = (packedVersion >> 16) & 0xFF  // Extracts the top 8 bits.
    let minor = (packedVersion >> 8) & 0xFF  // Extracts the middle 8 bits.
    let patch = packedVersion & 0xFF  // Extracts the lowest 8 bits.

    return "\(major).\(minor).\(patch)"
  }

  func unpackSharpYUVVersion(_ packedVersion: Int32) -> String {
    let major = (packedVersion >> 24) & 0xFF  // Extracts the top 8 bits.
    let minor = (packedVersion >> 16) & 0xFF  // Extracts the middle 8 bits.
    let patch = packedVersion & 0xFF  // Extracts the lowest 16 bits.

    return "\(major).\(minor).\(patch)"
  }
}
