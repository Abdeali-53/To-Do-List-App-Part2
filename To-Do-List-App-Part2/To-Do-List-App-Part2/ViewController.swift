//  ViewController.swift

//  To-Do-List-App-Part2
//  Created by Abdeali Mody on 2020-12-02.
//  Student ID - 301085484
//
//  Description - Displays list of tasks, user can add new task with the help of + button
//  Also, lets the user to click on a particular task and redirect to the task information screen
//  2nd Screen lets the user to add a task description, with due date and task complete switch.
//  Version 1.0
//  Copyright © 2020 Abdeali. All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var tableViewTodoList: UITableView!
    @IBOutlet var task_name: UITextField!
    var database: Database = Database()
    var tasks:[Tasks] = []
    var selectedTask = Tasks()
    
    @IBOutlet var taskName: UITextField!

    let cellIdentifier = "Cell"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableViewTodoList.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tasks = database.query()
    }
    
    //Add Task Function.
    @IBAction func createTasks(_ sender: UIButton)
    {
        database.insert(name: task_name.text!)
        tasks = database.query()
        //need to add
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                
         guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "todolist") as? ViewController
         else
         {
            return
         }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("qty: "+String(tasks.count))
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableViewTodoList.dequeueReusableCell(
            withIdentifier: cellIdentifier, for: indexPath)
            as! TableViewCell

        cell.task_name = tasks[indexPath.row].name
        cell.due_date = tasks[indexPath.row].duedate
        
        cell.task_name_Label.font = UIFont.boldSystemFont(ofSize: 20)
        cell.due_date_Label.font = UIFont.boldSystemFont(ofSize: 17)

        let dueDateString = tasks[indexPath.row].duedate

        
        if(tasks[indexPath.row].task_is_completed == 1)
        {
            cell.markedAsCompleted_Switch.isOn = true
            
            //if the task is completed it cross the text
            let text = tasks[indexPath.row].name
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.task_name_Label.attributedText = attributeString
           
            //reseting the text color to black again in case it was red before
            cell.due_date_Label.textColor = UIColor.blue
            cell.due_date = "Completed"
        }
        
        cell.edit_Button.addTarget(self, action: #selector(goNextScreenAction(_:)), for: .touchUpInside)
    
        return cell
    }
    
    //This function will help to move on second view controller screen.
    @objc func goNextScreenAction(_ sender:UIButton!)
    {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TaskDetails_ViewController") as? Task_Details_ViewController
        else
        {
            return
        }
        
        let editButtonPos:CGPoint = sender.convert(CGPoint.zero, to:self.tableViewTodoList)
        let indexPath = self.tableViewTodoList.indexPathForRow(at: editButtonPos)
        let index = indexPath!.row
        selectedTask = tasks[index]
        viewController.tasksList = selectedTask
    
        navigationController?.pushViewController(viewController, animated: true)
    }
}
