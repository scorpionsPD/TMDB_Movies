//
//  Enums.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import Foundation

enum region:String {
    case hollyWood = "US"
    case bollyWood = "IN"
}

enum DetailSection: Int {
    case header = 0
    case videos
    case casting
}


enum languages: String {
    case hindi = "hi"
    case english = "en"
}

enum Category: Int {
    case now_playing = 0
    case popular
    case top_rated 
    case upcoming
}

enum NavigationTitle: Int {
    case nowPlaying = 0
    case popular
    case topRated
    case upcoming
    
    public init(rawValue:Int){
        switch rawValue {
        case NavigationTitle.nowPlaying.rawValue:
            self = NavigationTitle.nowPlaying
        case NavigationTitle.popular.rawValue:
            self = NavigationTitle.popular
        case NavigationTitle.topRated.rawValue:
            self = NavigationTitle.topRated
        case NavigationTitle.upcoming.rawValue:
            self = NavigationTitle.upcoming
        default:
            self = NavigationTitle.nowPlaying
 
        }
        
    }
}
