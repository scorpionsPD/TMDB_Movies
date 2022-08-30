//
//  UserDefaultsManager.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import Foundation

enum UserDefaultsManager {
    static func getUsername() -> String? {
        return UserDefaults.standard
            .string(forKey: Constants.UserDefaults.usernameKey)
    }

    static func setUsername(_ username: String) {
        UserDefaults.standard
            .set(username, forKey: Constants.UserDefaults.usernameKey)
    }
}
