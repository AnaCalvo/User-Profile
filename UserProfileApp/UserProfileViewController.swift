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
    

    @IBOutlet weak var userLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    
        if UserDefaultsUtility.isUserLoggedIn() == false {
            
            performSegue(withIdentifier: "ShowLoginModally", sender: self)
            
        } else {
            
            userLabel.text = UserDefaultsUtility.getUserEmail()
            
            if UserDefaultsUtility.getUserPhoto() != nil {
                
                let photo = UserDefaultsUtility.getUserPhoto() as! NSData
                avatar.image = UIImage(data: photo as Data)
                
            } else {
                
                avatar.image = #imageLiteral(resourceName: "default_avatar")
                
            }
        }
    }

    
    @IBAction func doLogout(_ sender: Any) {
        
        performSegue(withIdentifier: "ShowLoginModally", sender: self)
        UserDefaultsUtility.setUserAsLoggedOut()
        UserDefaultsUtility.removeUserEmail()
        UserDefaultsUtility.removeUserPhoto()
        
    }
    
    @IBAction func changeAvatar(_ sender: Any) {
        
        let alertController = UIAlertController(title: nil, message: "Select your photo from:", preferredStyle: .actionSheet)
        
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
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }

    func openCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.cameraDevice = .front
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func openPhotoLibrary() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let imageData = UIImageJPEGRepresentation(image, 0.6) as NSData?
        let compressedJPGImage = UIImage(data: imageData! as Data)
        avatar.image = compressedJPGImage
        UserDefaultsUtility.saveUserPhoto(photo: imageData!)
        dismiss(animated:true, completion: nil)
    }
    
}
