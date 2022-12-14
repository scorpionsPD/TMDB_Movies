//
//  String+Locale.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya on 28/08/22.
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//
import Foundation

extension String {
    //e.g. "DE"
    static var regionIso31661: String {
        if let regionCode = Locale.current.regionCode {
            return regionCode
        }

        var locale = Locale.current.identifier
        locale = locale.replacingOccurrences(of: "-", with: "_")

        if let dotRange = locale.range(of: "_") {
            locale.removeSubrange(locale.startIndex..<dotRange.upperBound)
        }
        return locale
    }

    //e.g. "de"
    static var languageIso6391: String {
        if let languageCode = Locale.current.languageCode {
            return languageCode
        }

        var locale = Locale.current.identifier
        locale = locale.replacingOccurrences(of: "-", with: "_")

        if let dotRange = locale.range(of: "_") {
            locale.removeSubrange(dotRange.lowerBound..<locale.endIndex)
        }
        return locale
    }

    //e.g. "de-DE
    static var languageFormattedForTMDb: String {
        return Locale.current.identifier
            .replacingOccurrences(of: "_", with: "-")
    }
}
