//
//  SearchController.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import UIKit

class SearchController: UISearchController {
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    func setup() {
        obscuresBackgroundDuringPresentation = false
        isActive = false
        searchBar.sizeToFit()

        if #available(iOS 11.0, *) {
            guard let textfield = searchBar.value(forKey: "searchField") as? UITextField,
                let backgroundview = textfield.subviews.first
                else { return }
            backgroundview.backgroundColor = .black
            backgroundview.layer.cornerRadius = 10
            backgroundview.clipsToBounds = true
        }
    }

}
