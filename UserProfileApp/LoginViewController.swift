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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func doLogin(_ sender: UIButton) {
        
        let email = emailInput.text
        let password = passwordInput.hasText
        
        guard isValidEmail(email: email) == true,
            password == true
            else { return displayLoginError () }
        
        UserDefaultsUtility.setHasLogged()
        presentUserProfile()

    }
    
   
    // Email validation
    func isValidEmail(email: String?) -> Bool {
        
        guard email != nil else { return false }
        let checkCharacters = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", checkCharacters)
        return predicate.evaluate(with: email)
    }
    
    // Unsuccessful login alert
    func displayLoginError () {
        
        let unsuccessLoginalert = UIAlertController(title: "Upsss 😕", message: "Check out the fields. Something is wrong.", preferredStyle: UIAlertControllerStyle.alert)
        
        unsuccessLoginalert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(unsuccessLoginalert, animated: true, completion: nil)
        
    }
    
    func presentUserProfile() {
        
        guard let userController = UIStoryboard(name: "UserProfile", bundle: nil).instantiateViewController(withIdentifier: "UserProfileViewController") as? UserProfileViewController
            else { return }
        
        self.dismiss(animated: true, completion: nil)
        present(userController, animated: true, completion: nil)
    }

    
}