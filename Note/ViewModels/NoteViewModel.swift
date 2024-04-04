//
//  NoteViewModel.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 8/3/2567 BE.
//

import Foundation
import FirebaseFirestore

class NoteViewModel: ObservableObject {
    @Published var showingnewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("notes")
            .document(id)
            .delete()
    }
}
