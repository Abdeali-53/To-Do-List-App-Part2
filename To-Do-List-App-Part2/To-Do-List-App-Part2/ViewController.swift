//
//  ViewController.swift
//  To-Do-List-App-Part2
//
//  Created by Abdeali Mody on 2020-12-02.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    
    @IBOutlet var tableViewTodoList: UITableView!
    @IBOutlet var task_name: UITextField!
    var database: Database = Database()
    var tasks:[Tasks] = []

    
    @IBOutlet var taskName: UITextField!

    
    let cellIdentifier = "Cell"
    
    @IBAction func createTasks(_ sender: UIButton) {
        database.insert(name: task_name.text!)
        
        tasks = database.query()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("qty: "+String(tasks.count))
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewTodoList.dequeueReusableCell(
            withIdentifier: cellIdentifier, for: indexPath)
            as! TableViewCell

        cell.task_name = tasks[indexPath.row].name
        cell.due_date = tasks[indexPath.row].duedate

        let dueDateString = tasks[indexPath.row].duedate
       
        
        if(tasks[indexPath.row].task_is_completed == 1){
            cell.markedAsCompleted_Switch.isOn = true

            cell.due_date = "Completed"
        }

        cell.edit_Button.addTarget(self, action: #selector(goNextScreenAction(_:)), for: .touchUpInside)
        
        return cell
        
    }
    
    @objc func goNextScreenAction(_ sender:UIButton!) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TaskDetails_ViewController") as? Task_Details_ViewController else {
            return
        }
        
    
        navigationController?.pushViewController(viewController, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewTodoList.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        tasks = database.query()
        
    }
 
    
    
}
