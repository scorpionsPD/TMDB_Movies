//
//  UIView+Bounce.swift
//  MoviesInterest
//
//  Created by Pradeep Dahiya  .
//  Copyright © 2022 Pradeep Dahiya. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func bounce() {
        let origin:CGPoint = self.center
        let target:CGPoint = CGPoint(x : self.center.x, y : self.center.y-40)
        let bounce = CABasicAnimation(keyPath: "position.y")
        bounce.duration = 0.3
        bounce.fromValue = origin.y
        bounce.toValue = target.y
        bounce.repeatCount = 1
        bounce.autoreverses = true
        self.layer.add(bounce, forKey: "position")
    }
}
