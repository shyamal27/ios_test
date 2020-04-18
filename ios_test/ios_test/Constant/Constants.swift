//
//  Constants.swift
//  ios_test
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//


struct Constants {
    /**
     URL for API call
     */
    
    static let jsonUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    /**
     This used as identifier in table view and collection view
     */
    static let cellIdentifier = "UserContentCell"
    
    /**
     For constant marging
     */
    
    static let constantMarginInCell = 10
    
    /**
     Constants when there is no data
     */
    
    static let noTitle = "No Title"
    static let noSubtitle = "No Subtitle"
    
    /**
     For tag for Activity Indicator
     */
    static var activityIndicatorTag: Int { return 999999 }
    
    /**
     Constant Messages for errors
     */
    static let networkNotAvailable = "Network not available"
    static let userListEmpty = "User Content List is empty"
}
