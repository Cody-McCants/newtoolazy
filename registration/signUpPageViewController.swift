//
//  signUpPageViewController.swift
//  registration
//
//  Created by student on 4/24/17.
//  Copyright © 2017 cs470. All rights reserved.
//

import UIKit
var msg : String?
class signUpPageViewController: UIViewController {
    
    let URL_Signup = "http://cs370group.com/AddAccount.php"

    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let requestURL = NSURL(string: URL_Signup)
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        request.httpMethod = "POST"
        
        
        let userFirstName = userFirstNameTextField.text;
        let userLastName = userLastNameTextField.text;
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let confirmedPassword = confirmPasswordTextField.text;
        
        // Check for empty fields
        if ((userFirstName?.isEmpty)! || (userLastName?.isEmpty)! || (userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (confirmedPassword?.isEmpty)!) {
            // Display alert message
            displayMyAlertMessage(userMessage: "All fields are requried");
            return;
        }
        
        if(userPassword != confirmedPassword) {
            // Display an alert message
            displayMyAlertMessage(userMessage: "Passwords do not match");
            return;
        }
        
        
        /* Store Data
        UserDefaults.standard.setValue(userFirstName, forKey: "userFirstName")
        UserDefaults.standard.setValue(userLastName, forKey: "userLastName")
        UserDefaults.standard.setValue(userEmail, forKey: "userEmail")
        UserDefaults.standard.setValue(userPassword, forKey: "userPassword")
        UserDefaults.standard.setValue(confirmedPassword, forKey: "confirmedPassord")
        UserDefaults.standard.synchronize()*/
        
        // creating the post parameter by concatenating the keys and values from text field
        let postParameters = "&FirstName="+userFirstName!+"&LastName="+userLastName!+"&Email="+userEmail!+"&Password="+userPassword!;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, reponse, error in
            
            if error != nil{
                print("Error is \(error)")
                return;
            }
            
            //parsing the response
            do {
                //converting response to NSDictionary
                let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                // parsing the json
                if let parseJSON = myJSON {
                    //creating a string
                    
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    
                    //printing the response
                    //checking to see if the returned value is true or false
                   
                }
            } catch {
                print(error)
            }
        }
        // executing the task
        task.resume()
        
        
        // Display alert message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: nil, preferredStyle: UIAlertControllerStyle.alert);
        myAlert.message = msg
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default) {
            action in self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion:nil)

        
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
    }
    
    func displayMyAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion:nil);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
