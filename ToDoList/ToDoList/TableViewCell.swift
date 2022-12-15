//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Lucas Blanchard on 18/11/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titreTodo: UITextField!
    @IBOutlet weak var descTodo: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
