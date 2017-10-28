//
//  UserProfileViewController.swift
//  UserProfileApp
//
//  Created by Ana Calvo on 28/10/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView! {
        
        didSet {
            avatar.layer.cornerRadius = avatar.frame.height/2
            avatar.clipsToBounds = true
            avatar.image = #imageLiteral(resourceName: "default_avatar")
        }
        
    }
    
    @IBOutlet weak var user: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let loginCompleted = UserDefaultsUtility.hasLogged()
        
        if loginCompleted == false {
            presentLogin()
        }
    }
    
    func presentLogin() {
        
        guard let loginController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
            else { return }
        
        self.dismiss(animated: true, completion: nil)
        present(loginController, animated: true, completion: nil)
    }


}
