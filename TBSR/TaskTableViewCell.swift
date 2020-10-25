//
//  TaskTableViewCell.swift
//  TBSR
//
//  Created by Jacob Sephton on 25/10/20.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var goal: UILabel!
    @IBOutlet weak var timeToDue: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
