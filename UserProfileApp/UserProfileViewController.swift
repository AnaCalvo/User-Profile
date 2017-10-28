//
//  UserProfileViewController.swift
//  UserProfileApp
//
//  Created by Ana Calvo on 28/10/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let loginCompleted = UserDefaultsUtility.hasLogged()
        
        if loginCompleted == false {
            presentLogin()
        }
    }
    
    @IBAction func changeAvatar(_ sender: Any) {
        
        let alertController = UIAlertController(title: nil, message: "Select your photo", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        alertController.addAction(cancelAction)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {
            action in
            self.openCamera()
        }
        alertController.addAction(cameraAction)
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) {
            action in
           self.openPhotoLibrary()
        }
        alertController.addAction(libraryAction)
        
        self.present(alertController, animated: true) {
            // ...
        }
    }
    
    
    func presentLogin() {
        
        guard let loginController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
            else { return }
        
        self.dismiss(animated: true, completion: nil)
        present(loginController, animated: true, completion: nil)
    }

    func openCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func openPhotoLibrary() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        avatar.image = image
        dismiss(animated:true, completion: {
            
            let imageData = UIImageJPEGRepresentation(self.avatar.image!, 0.6)
            let compressedJPGImage = UIImage(data: imageData!)
            UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        })
    }

}
