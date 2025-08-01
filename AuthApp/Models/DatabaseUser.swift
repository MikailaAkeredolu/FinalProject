//
//  DatabaseUser.swift
//  AuthApp
//
//  Created by Mikaila Akeredolu on 7/15/25.
//

import Foundation

struct DatabaseUser: Codable {
    let userID: String?
    let username: String?
    let email: String?
    let dateCreated: Date
}


extension DateFormatter {
    
    static let userFriendlyDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
}
