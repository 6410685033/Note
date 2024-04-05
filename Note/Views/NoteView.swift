//
//  ToDoListView.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 8/3/2567 BE.
//

import SwiftUI
import FirebaseFirestoreSwift

struct NoteView: View {
    
    @StateObject var viewModel: NoteViewModel
    @StateObject private var noteItemViewModel = NoteItemViewModel()
    @FirestoreQuery var items: [NoteItem]
    @State private var selectedNote: NoteItem?
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/notes")
        self._viewModel = StateObject(wrappedValue: NoteViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    NoteItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                        .tint(.red)
                        .onTapGesture {
                            selectedNote = item
                        }
                }
                .listStyle(PlainListStyle())
                .sheet(item: $selectedNote) { note in
                    NoteContentView(item: note, viewModel: noteItemViewModel)
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                Button {
                    viewModel.showingnewItemView = true
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingnewItemView) {
                NewItemView(newItemPresented: $viewModel.showingnewItemView)
            }
        }
    }
}

#Preview {
    NoteView(userId: "mLogCOM2DrNLPNnD0KdWfICfdlg1")
}
