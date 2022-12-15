//
//  MyViewController.swift
//  ToDoList
//
//  Created by Lucas Blanchard on 09/11/2022.
//

import UIKit

class MyViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titreTodo.text = todo[indexPath.row].nom
        cell.descTodo.text = todo[indexPath.row].desc
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            todo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.automatic)
        }
    }
    
    var  todo = [ToDo]()
    
    @IBOutlet weak var myTableView: UITableView!
    @IBAction func addButton(_ sender: Any) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        todo.append(ToDo(nom: "Aller en cours", desc: "Aller aux CM afin de réussir l'examen dans le but d'avoir son semestre dans l'objectif d'avoir son année et cela dans le but d'avoir son diplome"))
        todo.append(ToDo(nom: "Aller à l'examen", desc: "Réussir l'examen"))
        todo.append(ToDo(nom: "Aller sur OGE", desc: "Voir sa note"))
        
                myTableView.dataSource = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "more" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.todo = todo[myTableView.indexPathForSelectedRow!.row]
        }
    }
    
    @IBAction func unwind_add(unwindSegue: UIStoryboardSegue) {
        let thirdViewController = unwindSegue.source as! ThirdViewController
        if unwindSegue.identifier == "retour" {
            thirdViewController.dismiss(animated: true, completion: nil)
        }
        else if unwindSegue.identifier == "enregistrer" {
            if let ajout_nom = thirdViewController.nom.text, let ajout_desc = thirdViewController.desc.text {
                let ajout_todo = ToDo(nom: ajout_nom, desc: ajout_desc)
                todo.append(ajout_todo)
                myTableView.reloadData()
            }
        }
        
    }
    
}
