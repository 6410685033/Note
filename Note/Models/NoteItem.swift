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
    let createDate: TimeInterval
    var content: String
}
