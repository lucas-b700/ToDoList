//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Lucas Blanchard on 07/12/2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var todo: ToDo?

    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let val = todo{
            nom.text = val.nom
            desc.text = val.desc
            
        }
        
        
    }
    }
