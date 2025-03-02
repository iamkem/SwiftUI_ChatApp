//
//  PeopleView.swift
//  kChat
//
//  Created by Kem on 2/3/25.
//

import SwiftUI

struct PeopleView: View {
    var body: some View {
        VStack {
            Text("People Screen")
                .font(.largeTitle)
                .padding()
            Spacer()
            Text("Danh sách người dùng sẽ hiển thị đây")
                .foregroundColor(.gray)
            Spacer()
        }
        .navigationTitle("People")
    }
}
