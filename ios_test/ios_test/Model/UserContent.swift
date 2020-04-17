//
//  UserContent.swift
//  ios_test
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//

import Foundation
import UIKit

struct UserContent: Codable {
    
    let title: String?
    let description: String?
    let imageHref: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case imageHref
    }
    
}

struct UserContentWrapper: Codable {
    let title: String?
    let rows: [UserContent]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case rows
    }
    
}
