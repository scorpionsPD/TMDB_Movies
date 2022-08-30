//
//  MovieDetailPage+Webservices.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import Foundation

extension MovieDetailPage{
//    func loadMovieDetail(movie:Movie,completion: @escaping(MovieDetail) -> Void){
//        let resource = movie.getDetails
//
//        Webservice.load(resource: resource) { (result) in
//            switch result{
//            case .success(let result):
//                completion(result.self)
//            case .failure(_): break
//                completion(<#MovieDetail#>)
//            }
//        }
//    }
    
    func loadVideoDetail(movie:Movie,completion: @escaping(MovieVideos) -> Void){
        let resource = movie.getVideos
        Webservice.load(resource: resource) { (result) in
            switch result{
            case .success(let result):
                completion(result.self)
            case .failure(_): break
                //completion(MovieDetail)
                
            }
        }
    }
    
    func loadCreditsDetail(movie:Movie,completion: @escaping(MovieCredits) -> Void){
        let resource = movie.getCredits
        Webservice.load(resource: resource) { (result) in
            switch result{
            case .success(let result):
                completion(result.self)
            case .failure(_): break
                //completion(MovieDetail)
            }
        }
    }
}

