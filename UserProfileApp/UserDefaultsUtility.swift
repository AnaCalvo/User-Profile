//
//  UserDefaultsUtility.swift
//  UserProfileApp
//
//  Created by Ana Calvo on 28/10/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import Foundation

public class UserDefaultsUtility {
    
    static let hasLoggedKey = "HasLogged"
    
    static public func hasLogged() -> Bool {
        
        return UserDefaults.standard.bool(forKey: hasLoggedKey)
    }
    
    static public func setHasLogged() {
        
        UserDefaults.standard.set(true, forKey: hasLoggedKey)
    }
    
}
