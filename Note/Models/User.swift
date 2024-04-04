//
//  User.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 8/3/2567 BE.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
