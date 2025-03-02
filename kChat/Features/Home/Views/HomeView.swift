//
//  HomeView.swift
//  kChat
//
//  Created by Kem on 2/3/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            // Tab 1: Chats
            ChatsView()
                .tabItem {
                    Label("Chats", systemImage: "message")
                }
                .accentColor(.blue)
            
            // Tab 2: People
            PeopleView()
                .tabItem {
                    Label("People", systemImage: "person.2")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
