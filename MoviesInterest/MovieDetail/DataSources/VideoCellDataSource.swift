//
//  VideoCellDataSource.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import UIKit

class VideoCellDataSource: NSObject {
    var videoArray:[MovieVideo]?
    
    init(singleVideoArray:[MovieVideo]?) {
        self.videoArray = singleVideoArray
    }
}
extension VideoCellDataSource: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: VideoCollectionViewCell.self), for: indexPath) as! VideoCollectionViewCell
        cell.item = self.videoArray![indexPath.item]
        return cell
    }
}
