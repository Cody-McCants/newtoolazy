//
//  ItemsViewController.swift
//  tooLazy
//
//  Created by Mitchell Salas on 4/23/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit

class TasksViewController: UITableViewController{
    
    var availableTask: AvailableTasks!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
        
    }
    
    
   // override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return availableTask.allTasks.count
        
    //}
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        let task = availableTask.allTasks[indexPath.row]
        
        
        
        cell.nameLabel.text = task.name
        cell.valueLabel.text = "$\(task.valueInDollars)"
        
        
        return cell
    }
    
    @IBAction func addNewTask(_sender: UIButton){
        
        let newTask = availableTask.createTask()
        
        if let index = availableTask.allTasks.index(of: newTask){
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        
        
        
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton){
        
        if isEditing{
            sender.setTitle("Edit", for: .normal)
            
            setEditing(false, animated: true)
        }
        else{
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete{
            
            let task = availableTask.allTasks[indexPath.row]
            
            availableTask.removeTask(task)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    
    
  
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addTask"
        {
            if segue.destination is AddTaskViewController {
                
            }
        }
    }
    
    
}

