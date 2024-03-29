//
//  TaskDataModel.swift
//  TBSR
//
//  Created by Jacob Sephton on 15/10/20.
//

import Foundation



class TaskDataModel {
    // NOTE: This class has filesystem responsibilities. Only one instance of this class should be instantiated at any one time. If more instances are required in the future, the class should be modified to take a unique filesystem URL at construction time.
    
    // MARK: Properties
    private var taskList: [(String, Task)] = []// Store as an ordered set of key-value pairs. Looking up by name will be O(n) on the number of tasks, but we don't have to sort the dataset every time they're loaded into a table view.
    
    
    // MARK: Public methods
    func getTaskList() -> [(String, Task)] { // Read-only copy of entire task list (e.g. for initial load)
        if taskList.count == 0 {
            createSampleTaskList()
        }
        return taskList
    }
    
    func taskAt(_ index: Int) -> Task? {
        // Returns nil for bad index
        if  indexExistsInTaskList(index){
            return taskList[index].1
        } else {
            return nil
        }
    }
    
    func taskIndexBy(name: String) -> Int? {
        // Nil if name not present in list. Must search whole list for name (slow for large lists)
        if let selectedTaskIndex = taskList.firstIndex(where: { $0.0 == name }) {
            return selectedTaskIndex
        } else {
            return nil
        }
    }
    
    @discardableResult func addTask(_ task: Task) -> Int {
        let newIndex = taskList.count
        taskList.append((task.getNameString(), task))
        return newIndex
    }
    
    func replaceTaskAt(_ index: Int, with task: Task) throws {
        if indexExistsInTaskList(index) {
            taskList[index] = (task.getNameString(), task)
        } else {
            throw TaskListError.indexOutOfRange
        }
    }
    
    // MARK: Initialization
    init() {
        
    }
    
    // MARK: Private methods
    
    private func indexExistsInTaskList(_ index: Int) -> Bool {
        if index < 0 || index >= taskList.count {
            return false
        } else {
            return true
        }
    }
    
    private func createSampleTaskList() {
        var task = Task(name: "Empty bins", goal: "keep house clean", dueDate: Date.init(timeIntervalSinceNow: (7*24*3600 + 1)))
        addTask(task)
        task = Task(name: "Wash the windows", goal: "keep house clean", dueDate: Date(timeIntervalSinceNow: 3*24*3600 + 1))
        addTask(task)
        task = Task(name: "Play a game of Dota", goal: "Not suck at Dota", dueDate: Date(timeIntervalSinceNow: 3*24*3600 + 1))
        addTask(task)
        
    }
    
    // MARK: Error functions
    enum TaskListError: Error {
        case indexOutOfRange
    }
}

