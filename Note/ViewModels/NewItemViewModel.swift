//
//  NewItemViewModel.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 8/3/2567 BE.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var content: String = ""
    @Published var showAlert = false
    
    func save() {
        guard canSave else { return }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = NoteItem(id: newId
                                   , title: title
                                   , createDate: Date().timeIntervalSince1970
                                   , content: content)
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("notes")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard !content.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
}
