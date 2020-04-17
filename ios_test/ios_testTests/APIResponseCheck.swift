//
//  APIResponseCheck.swift
//  ios_testTests
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//


import XCTest
@testable import ios_test

import Alamofire

class APIResponseCheck: XCTestCase {
    
    var sut: UserContentAPI?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = UserContentAPI()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testAPIRequest() {
        
        let sut = self.sut
        
        let expect = XCTestExpectation(description: "callback")
        
        sut?.fetchContent(completion: { (userWrapper, error) in
            guard let userWrapper = userWrapper else {
                XCTAssertNil(error, "Whoops, error \(error!.localizedDescription)")
                expect.fulfill()
                return
            }
            XCTAssertNotNil(userWrapper, "No response")
            expect.fulfill()
        })
        
        wait(for: [expect], timeout: 3.1)
    }
    
}
