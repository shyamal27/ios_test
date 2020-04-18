//
//  BaseRestAPI.swift
//  ios_test
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//


import Foundation
import Alamofire

class BaseRestAPI: NSObject {
    
    class func requestGETURL(_ strURL: String,
                             completion:@escaping (Data?, Error?) -> Void) {
        Alamofire.request(strURL, method: .get, parameters: nil,
                          encoding: JSONEncoding.default, headers: nil).responseString { (response) in
                            switch response.result {
                            case .success:
                                let responseData = response.value?.data(using: .utf8)
                                completion(responseData, nil)
                            case .failure((let error)):
                                completion(nil, error)
                            }
        }
    }
}
