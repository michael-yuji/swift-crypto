//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCrypto open source project
//
// Copyright (c) 2024 Apple Inc. and the SwiftCrypto project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCrypto project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
import Foundation

func I2OSP(value: Int, outputByteCount: Int) -> Data {
    precondition(outputByteCount > 0, "Cannot I2OSP with no output length.")
    precondition(value >= 0, "I2OSP requires a non-null value.")

    let requiredBytes = Int(ceil(log2(Double(max(value, 1) + 1)) / 8))
    precondition(outputByteCount >= requiredBytes)

    var data = Data(repeating: 0, count: outputByteCount)

    for i in (outputByteCount - requiredBytes)...(outputByteCount - 1) {
        data[i] = UInt8(truncatingIfNeeded: (value >> (8 * (outputByteCount - 1 - i))))
    }

    return data
}