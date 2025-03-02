//
//  ChatView.swift
//  kChat
//
//  Created by Kem on 2/3/25.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        VStack {
            Text("Chats Screen")
                .font(.largeTitle)
                .padding()
            Spacer()
            Text("Danh sách các cuộc trò chuyện sẽ hiển thị đây")
                .foregroundColor(.gray)
            Spacer()
        }
        .navigationTitle("Chats")
    }
}
