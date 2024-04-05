//
//  NoteContentView.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 4/4/2567 BE.
//

import SwiftUI

struct NoteContentView: View {
    @State var item: NoteItem
    @ObservedObject var viewModel: NoteItemViewModel
        
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
            .onDisappear {
                viewModel.saveChange(id: item.id, content: item.content)
            }
        }
    }
    
#Preview {
    NoteContentView(item: .init(id: "123", title: "New Note", createDate: Date().timeIntervalSince1970, content: "abcdefg"), viewModel: NoteItemViewModel())
}
