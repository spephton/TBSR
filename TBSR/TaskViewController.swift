//
//  TaskViewController.swift
//  TBSR
//
//  Created by Jacob Sephton on 15/10/20.
//

import UIKit

class TaskViewController: UIViewController{
    
    // MARK: Properties
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let testTask = Task(name: "Empty the bins", goal: "keep the house clean", dueDate: Date(timeIntervalSinceNow: 12*24*3600))
        
        
        
        //Test layout in simulator
        taskName.text = testTask.getNameString()
        goalLabel.text = testTask.getGoalDisplayString()
        
        let timeToDue = testTask.getTimeToDueDisplayString()
        let clockSymbol = NSTextAttachment()
        let boldConfiguration = UIImage.SymbolConfiguration(pointSize: CGFloat(21), weight: .bold)
        clockSymbol.image = UIImage(systemName: "clock", withConfiguration: boldConfiguration)
        let dueDateDisplayText = NSMutableAttributedString(string: "")
        dueDateDisplayText.append(NSAttributedString(attachment: clockSymbol))
        dueDateDisplayText.append(NSAttributedString(string: " "))
        dueDateDisplayText.append(NSAttributedString(string: timeToDue))
        
        dueDateLabel.attributedText = dueDateDisplayText
        
    }


}

