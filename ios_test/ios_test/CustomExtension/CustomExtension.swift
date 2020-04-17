//
//  CustomExtension.swift
//  ios_test
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//

import Foundation
import UIKit

/**
 This extension is used for adding global activity indicator
 */

extension UIViewController {
    
    func startActivityIndicator(
        style: UIActivityIndicatorView.Style = .whiteLarge,
        location: CGPoint? = nil) {
        
        let loc = location ?? view.center
        
        DispatchQueue.main.async {
            
            let activityIndicator = UIActivityIndicatorView(style: style)
            activityIndicator.color = UIColor.black
            activityIndicator.tag = Constants.activityIndicatorTag
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let activityIndicator = self.view.subviews.filter({
                $0.tag == Constants.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    func isActivityIndicatorAnimating() -> Bool {
        if let activityIndicator = view.subviews.filter({
            $0.tag == Constants.activityIndicatorTag}).first as? UIActivityIndicatorView {
            return activityIndicator.isAnimating
        }
        return false
    }
}
