//
//  Observable.swift
//  ios_test
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//

import Foundation
import UIKit

class Observable<T> {
    
    typealias EventListener = (T) -> Void
    
    var listener: EventListener?
    var value: T {
        didSet {
            listener?(self.value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    public func bind(listener: EventListener?) {
        self.listener = listener
    }
    
    public func bindAndFire(listener: EventListener?) {
        self.listener = listener
        self.listener?(value)
    }
    
}
