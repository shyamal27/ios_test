//
//  ios_testTests.swift
//  ios_testTests
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//

import XCTest
@testable import ios_test

class ios_testTests: XCTestCase {

    var sut: UserContentViewModel!
    var mockAPIService: UserContentAPI!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        mockAPIService = UserContentAPI()
        sut = UserContentViewModel(content: [], service: mockAPIService, title: "Title")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_FetchUserContentList() {
        sut.fetchContent()
        
        let expect = self.expectation(description: "Expected to fecth content list")
        
        sut.contentList.bind { (_) in
            XCTAssert(!self.sut.contentList.value.isEmpty)
            expect.fulfill()
        }
        
        sut.showError.bind { (value) in
            XCTAssertNil(value, "Error is \(value)")
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 3.0)
    }
    
    func test_LoadingWhenFetching() {
        var showLoadingStatus = false
        let expect = XCTestExpectation(description: "Show Loading status updated")
        sut.showLoading.bind {
            showLoadingStatus = $0
            expect.fulfill()
        }
        
        sut.fetchContent()
        
        XCTAssertTrue( showLoadingStatus )
        
        wait(for: [expect], timeout: 3.0)
        
    }

}
