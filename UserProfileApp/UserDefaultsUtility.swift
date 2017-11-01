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
    
    static public func isUserLoggedIn() -> Bool {
        
        return UserDefaults.standard.bool(forKey: isUserLoggedInKey)
    }
    
    static public func setUserAsLoggedIn() {
        
        UserDefaults.standard.set(true, forKey: isUserLoggedInKey)
    }
    
    static public func setUserAsLoggedOut() {
        
        UserDefaults.standard.set(false, forKey: isUserLoggedInKey)
    }
    
}
