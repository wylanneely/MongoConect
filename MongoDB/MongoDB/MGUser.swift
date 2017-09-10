//
//  MGUser.swift
//  MongoDB
//
//  Created by ALIA M NEELY on 9/9/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation

class MGUSer {
    // Note: - Add a way for users to shows many messages they sent like legacy, newbie, trial, member, vetran,
    
    
    //able to change display name and picture
    var displayName: String
    var displayPicture: Int
    var userDescription: String
    var theme: Int
    let email: String
    let password: String
    
    var phoneNumber: Int?
    
    init(name: String, displayName: String = "", description: String = "", picture: Int = 0, theme: Int = 0, email: String, password: String, phoneNumber: Int? = nil ) {
        if displayName == "" {
            self.displayName = email
        } else {
            self.displayName = displayName
        }
        self.userDescription = description
        self.displayPicture = picture
        self.theme = theme
        self.email = email
        self.phoneNumber = phoneNumber
        self.password = password
        
    }
    
    
    
    
}
