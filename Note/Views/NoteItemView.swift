//
//  NoteItemView.swift
//  Note
//
//  Created by Thammasat Thonggamgaew on 8/3/2567 BE.
//

import SwiftUI

struct NoteItemView: View {
    @StateObject var viewModel = NoteItemViewModel()
    let item: NoteItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title2)
                    .bold()
                Text(item.content)
                    .font(.caption)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    NoteItemView(item: .init(id: "123", title: "New Note", createDate: Date().timeIntervalSince1970, content: "abcdefg"))
}
