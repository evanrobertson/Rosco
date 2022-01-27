//
//  StringExtensions.swift
//  Rosco
//
//  Created by Evan Robertson on 19/04/2015.
//  Copyright (c) 2015 Evan Robertson. All rights reserved.
//

import Foundation

extension String {
    /// Truncates the string to length number of characters and
    /// appends optional trailing string if longer
    func truncate(length: Int, trailing: String? = nil) -> String {
        let trimmed = trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)

        if trimmed.count > length {
            let substring = trimmed.prefix(length)
            return substring + (trailing ?? "")
        } else {
            return self
        }
    }
}
