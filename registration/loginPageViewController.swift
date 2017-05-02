//
//  loginPageViewController.swift
//  registration
//
//  Created by student on 4/24/17.
//  Copyright © 2017 cs470. All rights reserved.
//

import UIKit

class loginPageViewController: UIViewController {

    @IBOutlet weak var loginEmailTextField: UITextField!
    
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let loginEmail = loginEmailTextField.text
        let loginPassword = loginPasswordTextField.text
        let storedEmail = UserDefaults.standard
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
