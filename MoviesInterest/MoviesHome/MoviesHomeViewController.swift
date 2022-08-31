//
//  MoviesHomeViewController.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import UIKit


class MoviesHomeViewController: UIViewController {

    var moviesDataSource:HomeScreenDataSource?
    var delegate: HomeScreenDelegates?
    var swipeView:SwipableView?
    
    var selectedMovie: Movie?
    var currentPage: Int?
    var totalResults: Int?
    
    //Side More Item
    var sideMenubarLeft:SideMenubar!
    var arrBtnImageListLeft = [SideMenuImageList]()
    
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.sync {
                let dataSource = HomeScreenDataSource(movieList: self.movies)
                self.swipeView!.dataSource = dataSource
                self.swipeView!.delegate = self
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        
        if !Reachability.isConnectedToNetwork() {
            self.showAlert(withMessage: Alert.connectionError)
        }

        swipeView = SwipableView(frame: self.view.frame)
        
        self.view.addSubview(self.swipeView!)
        loadMovies(category: .now_playing) { [weak self] movies in
            self?.movies = movies
        }
        //MARK: Side Menu Initialisation
        setupSideMenu()
        
        //MARK: Title set
        self.title = String(describing: NavigationTitle.init(rawValue: 0)).uppercased()
        
       let movie = Movie(id: 5, title: "Superman", genereIDs: [28], voteAverage: 0, overview: "", posterPath: "")
        print(movie.genreString())
    }
    
    //MARK: View Will appear
    override func viewWillAppear(_ animated: Bool) {
        AppUtility.lockOrientation(.portrait) // Fix orientation for home screen only
        self.swipeView?.bounce() // Bounce effect to swow spwipable property
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.all)
    }
    
    //MARK: Navigation button Actions
    @IBAction func menuPressed(_ sender: Any) {
        if !sideMenubarLeft.isShowingMenuBar {
            sideMenubarLeft.show(isShowingLeftToRight: true)
        } else { sideMenubarLeft.hide()}
    }
    @IBAction func searchPressed(_ sender: Any) {
        perform(segue: .showSearch, sender: nil)
    }
    
    // MARK: Orientation handle
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}
extension MoviesHomeViewController: SwipableViewDelegate{
    func swipableViewCurrentItemIndexDidChange(_ swipableView: SwipableView?) {
        
    }
    func swipableView(_ swipableView: SwipableView?, didSelectItemAt index: Int) {
        let someVC = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailPage") as! MovieDetailPage
        someVC.setSelectedMovie(movie: movies[index])
        self.navigationController?.pushViewController(someVC, animated: true)
    }
    func swipeDownFinished(_ swipableView: SwipableView?) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        sideMenubarLeft.hide()
    }
    func swipeUPFinished(_ swipableView: SwipableView?) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        sideMenubarLeft.hide()
    }
}
