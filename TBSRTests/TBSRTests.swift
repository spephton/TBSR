//
//  TBSRTests.swift
//  TBSRTests
//
//  Created by Jacob Sephton on 15/10/20.
//

import XCTest
@testable import TBSR

class TBSRTests: XCTestCase {
    /*
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    */
    
    // MARK: Date tests
    
    func testDisplayStringExtension() {
        let date = Date()
        
        let seconds: TimeInterval = 1
        let minutes: TimeInterval = 60
        let hours = minutes*60
        let days = hours*24
        let weeks = days*7
        let years = days*365.25
        let months = years/12
        var displayString: String
        
        // negative interval
        displayString = date.displayStringOfTimeInterval(-(10*days + 30*minutes))
        XCTAssert(displayString == "Positive time interval required.")
        
        // positive, but less than a minute
        displayString = date.displayStringOfTimeInterval(20*seconds)
        XCTAssert(displayString == "1m")
        
        // less than an hour
        displayString = date.displayStringOfTimeInterval(35*minutes + 2*seconds)
        XCTAssert(displayString == "35m")
        
        
        // less than a day
        displayString = date.displayStringOfTimeInterval(4*hours + 59*minutes)
        XCTAssert(displayString == "4h")
        
        // just slightly over one day (rounding down is expected behaviour, so we add 2 seconds)
        displayString = date.displayStringOfTimeInterval(24*hours + 2*seconds)
        XCTAssert(displayString == "1d")
        
        // almost a week
        displayString = date.displayStringOfTimeInterval(6*days + 23*hours + 59*minutes + 59*seconds)
        XCTAssert(displayString == "6d")
        
        // a week
        displayString = date.displayStringOfTimeInterval(1*weeks + 2*seconds)
        XCTAssert(displayString == "1w")
        
        // 30 days
        displayString = date.displayStringOfTimeInterval(30*days)
        XCTAssert(displayString == "4w")
        
        // a month
        displayString = date.displayStringOfTimeInterval(1*months + 2*seconds)
        XCTAssert(displayString == "1mo.")
        
        // less than a year
        displayString = date.displayStringOfTimeInterval(365*days)
        XCTAssert(displayString == "11mo.")
        
        // a year
        displayString = date.displayStringOfTimeInterval(1*years + 2*seconds)
        XCTAssert(displayString == "1y")
        
        // half-century
        displayString = date.displayStringOfTimeInterval(50*years + 2*seconds)
        XCTAssert(displayString == "50y")
    }
}
