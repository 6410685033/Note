//
//  NoteItem.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 8/3/2567 BE.
//

import Foundation

struct NoteItem: Codable, Identifiable {
    let id: String
    let title: String
//    let dueDate: TimeInterval
    let createDate: TimeInterval
//    var isDone: Bool
    var content: String
    
//    mutating func setDone(_ state: Bool) {
//            isDone = state
//        }
}
