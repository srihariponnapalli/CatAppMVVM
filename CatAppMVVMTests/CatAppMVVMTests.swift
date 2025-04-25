//
//  CatAppMVVMTests.swift
//  CatAppMVVMTests
//
//  Created by user260574 on 4/25/25.
//

import XCTest
@testable import CatAppMVVM

class CatServiceTests: XCTestCase {
    var service: MockCatService!
    
    override func setUp() {
        super.setUp()
        service = MockCatService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testFetchCatFact() {
        let expectation = self.expectation(description: "Fetching cat fact")
        
        service.fetchCatFact { catFact in
            XCTAssertNotNil(catFact)
            XCTAssertEqual(catFact?.data.first, "these are nice cats")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchCatImage() {
        let expectation = self.expectation(description: "Fetching cat image")
        
        service.fetchCatImage { catImages in
            XCTAssertNotNil(catImages)
            XCTAssertEqual(catImages?.first?.url, "https://image.jpg")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

