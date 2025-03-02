//
//  kChatApp.swift
//  kChat
//
//  Created by Kem on 27/2/25.
//

import SwiftUI
import FirebaseCore // Nhập Firebase để cấu hình
import FirebaseAuth

@main
struct ChatApp: App {
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser != nil {
                HomeView()
            } else {
                LoginView() // Khởi đầu bằng màn hình đăng nhập
            }
        }
    }
}
