//
//  NoteContentView.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 4/4/2567 BE.
//

import SwiftUI

struct NoteContentView: View {
//    @StateObject var viewModel: NoteItemViewModel
    @State var item: NoteItem
//    @State var editedContent: String
    
    //    init(item: NoteItem) {
    //        self._item = State(initialValue: item)
    //        self._editedContent = State(initialValue: item.content)
    //    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(item.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Created at \(Date(timeIntervalSince1970: item.createDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
                Divider()
                
//                TextEditor(text: $editedContent)
                TextEditor(text: $item.content)
                    .font(.body)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.secondaryLabel), lineWidth: 1)
                    )
                    .frame(minHeight: 200)
            }
            .padding()
        }
        .navigationTitle("Note Content")
        .navigationBarTitleDisplayMode(.inline)
//        .onDisappear {
//            // Save the changes to the content when the view disappears
//            $viewModel.saveChanges()
//        }
    }
}
    
#Preview {
    NoteContentView(item: .init(id: "123", title: "New Note", createDate: Date().timeIntervalSince1970, content: "abcdefg"))
}
