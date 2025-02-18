// SPDX-License-Identifier: BSD-3-Clause
// Copyright Contributors to the WebP Codec project

import libwebp
import Foundation

public enum WebPError: Error
{
    case unknownDecodingError
    case unknownEncodingError
}

public struct WebP
{
    public static let version = "1.4.0"

    public var width: Int
    public var height: Int
    public var rgba: [UInt8]

    public init(width: Int, height: Int, rgba: [UInt8])
    {
        self.width = width
        self.height = height
        self.rgba = rgba
    }

    public static func decode(_ data: [UInt8]) throws -> WebP
    {
        var width: Int32 = 0
        var height: Int32 = 0
        guard let rgba = WebPDecodeRGBA(data, data.count, &width, &height) else
        {
            throw WebPError.unknownDecodingError
        }

        let webp = WebP(
            width: Int(width),
            height: Int(height),
            rgba: [UInt8](Data(bytes: rgba, count: Int(width * height * 4)))
        )
        WebPFree(rgba)
        return webp
    }

    /// - Parameter quality: A value from 0 to 100 which controls output quality. 100 produces
    ///   the best quality output but also the largest output.
    public func encode(quality: Float) throws -> [UInt8]
    {
        var data: UnsafeMutablePointer<UInt8>?
        let size = WebPEncodeRGBA(
            rgba,
            Int32(width),
            Int32(height),
            Int32(width * 4),
            quality,
            &data
        )

        guard let data = data else
        {
            throw WebPError.unknownEncodingError
        }

        let dataCopy = [UInt8](Data(bytes: data, count: Int(size)))
        WebPFree(data)
        return dataCopy
    }
}
