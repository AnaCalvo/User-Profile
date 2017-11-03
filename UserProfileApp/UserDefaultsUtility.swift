//
//  UserDefaultsUtility.swift
//  UserProfileApp
//
//  Created by Ana Calvo on 28/10/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import Foundation

public class UserDefaultsUtility {
    
    static let isUserLoggedInKey = "IsUserLoggedIn"
    static let userEmailKey = "UserEmail"
    static let userPhotoKey = "UserPhoto"
    
    static public func isUserLoggedIn() -> Bool {
        
        return UserDefaults.standard.bool(forKey: isUserLoggedInKey)
    }
    
    static public func setUserAsLoggedIn() {
        
        UserDefaults.standard.set(true, forKey: isUserLoggedInKey)
    }
    
    static public func setUserAsLoggedOut() {
        
        UserDefaults.standard.set(false, forKey: isUserLoggedInKey)
    }
    
    static public func saveUserEmail(userEmail: String) {
        
        UserDefaults.standard.set(userEmail, forKey: userEmailKey)
    }
    
    static public func getUserEmail() -> String? {
        
        return UserDefaults.standard.value(forKey: userEmailKey) as? String
    }
    
    static public func removeUserEmail() {
        
        UserDefaults.standard.removeObject(forKey: userEmailKey)
    }
    
    static public func saveUserPhoto(photo: NSData) {
        
        UserDefaults.standard.set(photo, forKey: userPhotoKey)
    }
    
    static public func getUserPhoto() -> NSData? {
        
        return UserDefaults.standard.object(forKey: userPhotoKey) as? NSData
    }
    
    static public func removeUserPhoto() {
        
        UserDefaults.standard.removeObject(forKey: userPhotoKey)
    }
    
}
