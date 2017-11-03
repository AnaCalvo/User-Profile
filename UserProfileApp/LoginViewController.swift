//
//  LoginViewController.swift
//  UserProfileApp
//
//  Created by Ana Calvo on 28/10/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var background: UIView! {
        
        didSet {
            
            background.layer.cornerRadius = 8
        }
    }
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBAction func doLogin(_ sender: UIButton) {
        
        let email = emailInput.text
        let password = passwordInput.hasText
        guard
            isValidEmail(email: email) == true,
            password == true else {
                
                return displayLoginError()
        }
        
        presentUserProfile()
    }
    
    
    func isValidEmail(email: String?) -> Bool {
        
        guard email != nil else {
            
            return false
        }
        
        let checkCharacters = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", checkCharacters)
        return predicate.evaluate(with: email)
    }
    
    
    func displayLoginError() {
        
        let unsuccessLoginalert = UIAlertController(title: "Upsss 😕", message: "Check out the fields. \n Something is wrong.", preferredStyle: UIAlertControllerStyle.alert)
        
        unsuccessLoginalert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        unsuccessLoginalert.view.tintColor = UIColor(red: 252/255.0, green: 145/255.0, blue: 142/255.0, alpha: 1.0)
        
        self.present(unsuccessLoginalert, animated: true, completion: nil)
        
    }
    
    
    func presentUserProfile() {
        
        guard
            let navigationController = self.presentingViewController as? UINavigationController,
            let _ = navigationController.viewControllers[0] as? UserProfileViewController,
            let email = self.emailInput.text else {
                return
        }
        
        UserDefaultsUtility.setUserAsLoggedIn()
        UserDefaultsUtility.saveUserEmail(userEmail: email)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
