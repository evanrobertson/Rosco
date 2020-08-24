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
        return self
//        if count(self) > length {
//            var stringValue = self.substringToIndex(advance(self.startIndex, length))
//            stringValue = stringValue.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//            return stringValue + (trailing ?? "")
//        } else {
//            return self
//        }
    }
}
