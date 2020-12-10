//
//  TableViewCell.swift
//  To-Do-List-App-Part2
//  Created by Abdeali Mody on 2020-12-02.
//  Student ID - 301085484
//  Version 1.0
//  Copyright © 2020 Abdeali. All rights reserved.

import UIKit

class TableViewCell: UITableViewCell
{
    //Declaring variables for table view cell.
    var task_name_Label: UILabel!
    var due_date_Label: UILabel!
    var markedAsCompleted_Switch: UISwitch!
    var edit_Button: UIButton!

    var task_name: String = "" {
        didSet {
            if (task_name != oldValue)
            {
                task_name_Label.text = task_name
            }
        }
    }
    var due_date: String = "" {
        didSet {
            if (due_date != oldValue)
            {
                due_date_Label.text = due_date
            }
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
         super.init(style: style, reuseIdentifier: reuseIdentifier )
        
         // providing lable position, style & alignment.
         let task_name_LabelRect = CGRect(x: 0, y: 3, width: 150, height: 30)
         let task_name_Marker = UILabel(frame: task_name_LabelRect)
         task_name_Marker.textAlignment = NSTextAlignment.right
         contentView.addSubview(task_name_Marker)
        
        let task_name_ValueRect = CGRect(x: 0, y: 5, width: 200, height: 20)
        task_name_Label = UILabel(frame: task_name_ValueRect)
        contentView.addSubview(task_name_Label)

         let due_date_LabelRect = CGRect(x: 0, y: 3, width: 250, height: 25)
         let due_date_Marker = UILabel(frame: due_date_LabelRect)
         due_date_Marker.textAlignment = NSTextAlignment.right
         contentView.addSubview(due_date_Marker)
        
        let due_date_ValueRect = CGRect(x: 0, y: 25, width: 250, height: 20)
        due_date_Label = UILabel(frame: due_date_ValueRect)
        contentView.addSubview(due_date_Label)
        
        let markedAsCompleted_ButtonRect = CGRect(x: 280, y: 3, width: 30, height: 20)
        let markedAsCompleted_Marker = UISwitch(frame: markedAsCompleted_ButtonRect)
        markedAsCompleted_Marker.isOn = false
        contentView.addSubview(markedAsCompleted_Marker)
        
        let markedAsCompleted_ValueRect = CGRect(x: 280, y: 3, width: 30, height: 20)
        markedAsCompleted_Switch = UISwitch(frame: markedAsCompleted_ValueRect)
        contentView.addSubview(markedAsCompleted_Switch)
       
         let edit_ButtonRect = CGRect(x: 340, y: 3, width: 30, height: 30)
         let edit_Marker = UIButton(frame: edit_ButtonRect)
         edit_Marker.setBackgroundImage(UIImage(named: "editPencil"), for: UIControl.State.normal)
         edit_Marker.isPointerInteractionEnabled = true
         contentView.addSubview(edit_Marker)

        let edit_ValueRect = CGRect(x: 340, y: 3, width: 20, height: 20)
        edit_Button = UIButton(frame: edit_ValueRect)
        contentView.addSubview(edit_Button)
    }
  
        required init?(coder: NSCoder)
        {
            fatalError("init(coder:) has not been implemented")
        }
}

