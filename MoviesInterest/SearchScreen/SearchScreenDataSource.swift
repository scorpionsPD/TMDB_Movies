//
//  SearchScreenDataSource.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import UIKit

class SearchScreenDataSource: NSObject {
    var movieArray = Array<Movie>()
    init(movieList:[Movie]?) {
    self.movieArray = movieList!
    }
}

extension SearchScreenDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchTableViewCell.self)) as! SearchTableViewCell
        cell.item = movieArray[indexPath.row]
        return cell
    }
    
    
}
