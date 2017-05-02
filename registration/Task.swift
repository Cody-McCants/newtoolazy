//
//  Item.swift
//  tooLazy
//
//  Created by Mitchell Salas on 4/23/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit


class Task: NSObject{
    
    var name: String
    var valueInDollars: Int
    let dateCreated: Date
    var TaskDescription: String
    
    init(name: String, valueInDollars: Int, TaskDescription: String, dateCreated: Date){
        
        self.name = name
        self.valueInDollars = valueInDollars
        self.dateCreated = Date()
        self.TaskDescription = TaskDescription
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        
        if random{
            
            let tasks = ["Mow lawn", "Pick up Laundry", "Clean my house", "wash my car"]
            let idx = arc4random_uniform(UInt32(tasks.count))
            let randomtask = tasks[Int(idx)]
            let randomtasks = "\(randomtask)"
            
            let randomValue = Int(arc4random_uniform(100))
            
            self.init(name: randomtasks, valueInDollars: randomValue, TaskDescription: "none", dateCreated: Date())
            
        }
        else{
            self.init(name: "", valueInDollars: 0, TaskDescription: "", dateCreated: Date())
        }
    }
    
    
}
