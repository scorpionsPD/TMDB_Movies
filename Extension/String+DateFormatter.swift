//
//  String+DateFormatter.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import UIKit

extension String {
    private static let dateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    private static let iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        if #available(iOS 11.0, *) {
            formatter.formatOptions = [.withInternetDateTime,
                                       .withFractionalSeconds]
        } else {
            formatter.formatOptions = [.withInternetDateTime]
        }
        return formatter
    }()

    var dateFromString: Date? {
        String.dateFormatter.dateFormat = "yyyy-MM-dd"
        return String.dateFormatter.date(from: self)
    }

    public var dateFromImportedMoviesString: Date? {
        String.dateFormatter.dateFormat = "MMM dd, yyyy HH:mm:ss"
        return String.dateFormatter.date(from: self)
    }

    var dateFromISO8601: Date? {
        return String.iso8601Formatter.date(from: self)
    }
}

extension Date{
    
    private static let dateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    var stringFromDate: String{
        Date.dateFormatter.dateFormat = "yyyy"
        return Date.dateFormatter.string(from: self)
    }
    
}
