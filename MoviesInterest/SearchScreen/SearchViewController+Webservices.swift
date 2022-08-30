//
//  SearchViewController+Webservices.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import Foundation
extension SearchViewController {
    func loadMovies(forQuery query: String? = nil, nextPage: Bool = false, completion: @escaping ([Movie]) -> Void) {
        var pageToLoad = 1
        if let page = currentPage, nextPage {
            pageToLoad = page + 1
        }
        
        let resource: Resource<PagedMovieResult>?
        if let query = query, !query.isEmpty {
            resource = Movie.search(withQuery: query, page: pageToLoad)
        } else {
            return
        }
        
        Webservice.load(resource: resource) { result in
            switch result {
            case .failure:
                //self.showAlert(withMessage: Alert.loadingDataError)
                completion([])
            case .success(let result):
                self.currentPage = result.page
                self.totalResults = result.totalResults
                completion(result.results)
            }
        }
    }
}
