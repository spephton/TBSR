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
    
    //MARK: Getters

    
    
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
