//
//  StringInterpolation+extension.swift
//  Namaz
//
//  Copyright © 2020 Камиль Зиязетдинов. All rights reserved.
//

import Foundation

enum DateFormats: String {
    case ddMMMHHmm = "dd MMM HH:mm:ss"
    case HHmm = "HH:mm"
}

extension String.StringInterpolation {
    mutating func appendInterpolation(format: DateFormats, date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        
        let result = formatter.string(from: date)
        appendLiteral(result)
    }
}
