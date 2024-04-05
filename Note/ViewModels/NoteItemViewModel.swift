//
//  NoteItemViewModel.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 8/3/2567 BE.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NoteItemViewModel: ObservableObject {
    private var uid: String?
    private let db = Firestore.firestore()
    
    init() {
        self.uid = Auth.auth().currentUser?.uid
    }
    
    func saveChange(id: String, content: String) {
        guard let uid = self.uid else { return }
        
        db.collection("users")
          .document(uid)
          .collection("notes")
          .document(id)
          .updateData(["content": content]) { error in
              if let error = error {
                  print("Error updating document: \(error)")
              } else {
                  print("Document successfully updated")
              }
          }
    }
}
