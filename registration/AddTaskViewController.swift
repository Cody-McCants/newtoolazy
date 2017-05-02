//
//  DetailViewController.swift
//  tooLazy
//
//  Created by Mitchell Salas on 4/29/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit
var temp = "" as String?
var Categorys = "" as String?
class AddTaskViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var TitleField: UITextField!
   
    @IBOutlet weak var DescriptionField: UITextField!
    @IBOutlet weak var PriceField: UITextField!
    
    @IBOutlet weak var AddressField: UITextField!
    
    @IBOutlet weak var CategoryPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    @IBAction func AddTask(_ sender: UIButton) {
   
      
        
        //created NSURL
        let requestURL = NSURL(string: "http://www.cs370group.com/addTask.php")
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //getting values from text fields
        let Description = DescriptionField.text
        let Title = TitleField.text
        let Price = PriceField.text
        let Address = AddressField.text
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "Title="+Title!+"&Description="+Description!+"&Category="+Categorys!+"&Price="+Price!+"&Address="+Address!;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg : String!
                    
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    
                    //printing the response
                    print(msg)
                    
                }
            } catch {
                print(error)
            }
            
        }
        //executing the task
        task.resume()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CategoryPicker.delegate = self
        self.CategoryPicker.dataSource = self
        pickerData = ["Category","Yard Work","House Work","Manual Labor","Pick up","Delivery","Place Holder","Place Holder two"]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        Categorys = pickerData[row]
    }
}



