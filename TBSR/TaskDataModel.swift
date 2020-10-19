//
//  TaskDataModel.swift
//  TBSR
//
//  Created by Jacob Sephton on 15/10/20.
//

import Foundation



class Task {
    private var name: String
    private var goal: String
    private var dueDate: Date
    
    //MARK: getDisplayString
    
    func getNameDisplayString() -> String {
        return name
    }
    
    func getGoalDisplayString() -> String {
        let prepend = "to: "
        return prepend + goal
    }
    
    func getTimeToDueDisplayString() -> String {
        let timeToDue = dueDate.timeIntervalSinceNow
        return dueDate.displayStringOfTimeInterval(timeToDue)
    }
    
    
    init(name: String, goal: String, dueDate: Date) {
        self.name = name
        self.goal = goal
        self.dueDate = dueDate
    }
    
    func updateProperties(name: String?, goal: String?, dueDate: Date?) {
        if let newName = name {
            self.name = newName
        }
        if let newGoal = goal {
            self.goal = newGoal
        }
        if let newDueDate = dueDate{
            self.dueDate = newDueDate
        }
    }
}



class TaskDataModel {
    
    
    
    
    
    
    
    
    
}

extension Date {
    func displayStringOfTimeInterval(_ timeInterval: TimeInterval) -> String {
        // reference times
        let minuteSeconds: Double = 60
        let hourSeconds = minuteSeconds*60
        let daySeconds = hourSeconds*24
        let weekSeconds = daySeconds*7
        let yearSeconds = daySeconds*365.25
        let monthSeconds = yearSeconds/12
        
        // input and output variables
        let timeInSeconds = Double(timeInterval)
        var displayString: String
        
        
        
        // generate display string
        if timeInterval >= 0 {
            switch timeInSeconds {
            case 0 ..< minuteSeconds:
                displayString = "1m"
            case minuteSeconds ..< hourSeconds:
                displayString = String(Int(timeInSeconds/minuteSeconds)) + "m"
            case hourSeconds ..< daySeconds:
                displayString = String(Int(timeInSeconds/hourSeconds)) + "h"
            case daySeconds ..< weekSeconds:
                displayString = String(Int(timeInSeconds/daySeconds)) + "d"
            case weekSeconds ..< monthSeconds:
                displayString = String(Int(timeInSeconds/weekSeconds)) + "w"
            case monthSeconds ..< yearSeconds:
                displayString = String(Int(timeInSeconds/monthSeconds)) + "mo."
            default:
                displayString = String(Int(timeInSeconds/yearSeconds)) + "y"
            }
        } else {
            return "Positive time interval required."
        }
        
        return displayString
    }
}
