//
//  MovieDetailPage.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import UIKit

class MovieDetailPage: UIViewController {

    var dataSource:DetailDataSource?

    @IBOutlet weak var detailsTableView: UITableView!
    
    var ratingScore: UIButton = {
        let rating = UIButton()
        rating.tintColor = UIColor.green
        rating.setImage(#imageLiteral(resourceName: "ratingIcon"), for: .normal)
        rating.translatesAutoresizingMaskIntoConstraints = false
        return rating
    }()
    
    var selectedMovie:Movie!{
        didSet{
            //self.view.addSubview(self.detailsTableView)
            self.view.isUserInteractionEnabled = false
        }
    }
    override func viewDidLoad() {
        self.registerNib()
        guard let movie = selectedMovie else {return}
        
        loadVideoDetail(movie: movie) { (videos) in
            self.loadCreditsDetail(movie: movie, completion: { (credits) in
                let complete = CompleteMovieDetailModal(movieDetail: movie, movieVideos: videos, credits: credits)
                self.dataSource = DetailDataSource(data: complete)
                DispatchQueue.main.async {
                    self.detailsTableView.dataSource = self.dataSource
                    self.detailsTableView.reloadData()
                    self.view.isUserInteractionEnabled = true
                }
            })
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.title = selectedMovie.title
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.ratingScore)
        self.ratingScore.setTitle(String(selectedMovie.voteAverage), for: .normal)
    }
    
    func setSelectedMovie(movie: Movie) {
        self.selectedMovie = movie
    }

    func registerNib() {
        let nibHeader = UINib.init(nibName: String(describing: MovieHeaderCell.self), bundle: nil)
        detailsTableView.register(nibHeader, forCellReuseIdentifier: String(describing: MovieHeaderCell.self))
       
               let nibVideos = UINib.init(nibName: String(describing: MovieVideosTableViewCell.self), bundle: nil)
        detailsTableView.register(nibVideos, forCellReuseIdentifier: String(describing: MovieVideosTableViewCell.self))
       
               let nibCasting = UINib.init(nibName: String(describing: CastCrewTableViewCell.self), bundle: nil)
        detailsTableView.register(nibCasting, forCellReuseIdentifier: String(describing: CastCrewTableViewCell.self))
    }
}
