//
//  AvailableTasks.swift
//  tooLazy
//
//  Created by Mitchell Salas on 4/23/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit

class AvailableTasks{
    
    
    var allTasks = [Task]()
    
    @discardableResult func createTask() -> Task{
        
        let newTask = Task(random: true)
        allTasks.append(newTask)
        return newTask
    }
    
    
  /*  init(){
     
     for _ in 0..<20{
     createTask()
     }
     }
 */
    
    func removeTask(_ task: Task){
        
        if let index = allTasks.index(of: task){
            allTasks.remove(at: index)
        }
    }
    
    
    
}
