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
    
    // MARK: Task + data model tests
    func testDataModel() {
        let date = Date(timeIntervalSinceNow: 3600*24*7+1)
        let task1 = Task(name: "Vent", goal: "Prevent explosion", dueDate: date)
        let task2 = Task(name: "Drink water", goal: "Impress Homer", dueDate: date)
        let task3 = Task(name: "Go to clown college", goal: "Surprise Bart", dueDate: date)
        
        task2.updateProperties(name: nil, goal: nil, dueDate: Date(timeIntervalSinceNow: 3600*24*3+1))
        
        let dataModel = TaskDataModel()
        dataModel.addTask(task1)
        dataModel.addTask(task2)
        dataModel.addTask(task3)
        
        let index = dataModel.taskIndexBy(name: "Drink water")
        let retrievedTask = dataModel.taskAt(index!)
        retrievedTask!.updateProperties(name: "Make bird drink water", goal: nil, dueDate: nil)
        do {
            try dataModel.replaceTaskAt(index!, with: retrievedTask!)
        } catch TaskDataModel.TaskListError.indexOutOfRange {
            print("Error replacing task at index \(index!) of data model: index out of range")
        } catch {
            print("Unexpected error replacing task in data model: \(error)")
        }
        
        let newTask = Task(name: "Give Fat Tony the pretzel money", goal: "Not die", dueDate: date)
        
        let success: ()? = try? dataModel.replaceTaskAt(3, with: newTask)
        XCTAssertNil(success)
        
        let success2: ()? = try? dataModel.replaceTaskAt(0, with: newTask)
        XCTAssertNotNil(success2)
        
        let taskList = dataModel.getTaskList()
        XCTAssert(taskList[0].1.getNameString() == "Give Fat Tony the pretzel money")
        XCTAssert(taskList[1].1.getTimeToDueDisplayString() == "3d" &&
                    taskList[1].1.getNameString() == "Make bird drink water")
        XCTAssert(taskList[2].1.getGoalDisplayString() == "to: Surprise Bart")
        
    }
}
