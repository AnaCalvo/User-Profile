//
//  LoginViewController.swift
//  UserProfileApp
//
//  Created by Ana Calvo on 28/10/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func doLogin(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
