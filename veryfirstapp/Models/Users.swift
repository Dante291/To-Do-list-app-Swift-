//
//  Users.swift
//  veryfirstapp
//
//  Created by SAKSHI GUPTA on 23/05/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    let image: String
}
