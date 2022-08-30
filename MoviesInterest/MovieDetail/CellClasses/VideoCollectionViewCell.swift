//
//  VideoCollectionViewCell.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class VideoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var videoPlayer: WKYTPlayerView!
    
    var item: MovieVideo? {
        didSet{
            guard let item = item else {
                return
            }
            self.videoPlayer.load(withVideoId: item.key)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
