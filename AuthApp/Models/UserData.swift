//
//  UserData.swift
//  AuthApp
//
//  Created by Mikaila Akeredolu on 7/15/25.
//

import Foundation
import FirebaseAuth //User comes from FireBase

struct UserData{
    
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
    
    
}
