//
//  NoteApp.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 3/4/2567 BE.
//

import SwiftUI
import FirebaseCore

@main
struct NoteApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
