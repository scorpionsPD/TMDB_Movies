//
//  Segue.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import UIKit

enum Segue: String {
    case showMovieDetail = "ShowMovieDetailSegue"
    case showSearch = "ShowSearch"

    init?(initWith segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else {
            fatalError("Segue identifier not found.")
        }
        self.init(rawValue: identifier)
    }
}

extension UIViewController {
    func perform(segue: Segue, sender: AnyObject?) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: segue.rawValue, sender: sender)
        }
    }
}
