//
//  Task_Details_ViewController.swift
//  To-Do-List-App-Part2
//
//  Created by Abdeali Mody on 2020-12-02.
//

import UIKit

class Task_Details_ViewController: UIViewController {

    
    @IBOutlet var desc: UITextField!
    @IBOutlet var due: UISwitch!
    @IBOutlet var due_date: UIDatePicker!
    var task_name:String = ""
    @IBAction func due_Switch(_ sender: UISwitch) {
    }
    
    
    @IBAction func duedate(_ sender: UIDatePicker)
    {
        date = due_date.date
    }
    
    var database: Database = Database()
    var tasksList: Tasks? = nil
    
    @IBOutlet var is_completed: UISwitch!
    var date = Date()
    
    @IBAction func create(_ sender: UIButton)
    {
        var dateString  = ""
        var has_due_validation = 0
        
        if (due.isOn)
        {
            has_due_validation = 1
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateString = dateFormatter.string(from: due_date.date)
        }
    
        var is_completed_validation = 0
        
        if (is_completed.isOn)
        {
            is_completed_validation = 1
        }
        
        let alert = UIAlertController(title: "Create", message: "Are you sure you want to create this task?", preferredStyle: .alert)
        
        //addAction method is used to provide addtional buttons in the alert box for eg: Yes & No
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action in ()} ))
        
        //I have kept Style attribute to "default" and It will perform the default operations.
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            (self.database.update(name: self.task_name , description: self.desc.text!, task_has_due: has_due_validation, duedate: dateString, task_is_completed: is_completed_validation))
            
            
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    
             guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "todolist") as? ViewController else {
                return
            }
            self.navigationController?.pushViewController(viewController, animated: true)
     } ))
        
        present(alert,animated: true)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //task_name = tasksList!.name
        
    }
}
