//
//  Movie.swift
//  SwipeDemo
//
//  Created by Pradeep Dahiya.
//


import UIKit
import CoreData

class Movie: Codable {
    
    let id: Int64
    let title: String?
    let voteAverage: Double
    let posterPath: String?
    let overview: String
    let genreIDS: [Int]?
    var releaseDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case overview
        case genreIDS = "genre_ids"
        case releaseDate = "release_date"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int64.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
                
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
            ?? 0

        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        overview = try container.decode(String.self, forKey: .overview)

        genreIDS = try container.decodeIfPresent([Int].self, forKey: .genreIDS) ?? []
        
        let dateString = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        releaseDate = dateString?.dateFromString
    }

    // This is only for creating a movie to use it with the webservice
    init(id: Int64, title: String, genereIDs:[Int], voteAverage: Double, overview:String, posterPath: String) {
        self.id = id
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.posterPath = nil
        self.genreIDS = genereIDs
    }
    
    func genreString() -> String {
        var genreStr = String()
        for item in self.genreIDS! {
            let genreString = String(describing: getGenreString(rawValue: item))
            genreStr.append(genreString)
            genreStr.append("/")
        }
        return String(genreStr.dropLast())
    }
}
