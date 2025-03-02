//
//  LoginView.swift
//  kChat
//
//  Created by Kem on 2/3/25.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Login") {
                    viewModel.login()
                }
                Button("Login with Google") {
                    viewModel.loginWithGoogle()
                }
                .buttonStyle(.borderedProminent)
                
                if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                }
                
                NavigationLink(
                    destination: HomeView(),
                    isActive: $navigateToHome
                ) {
                    EmptyView()
                }
            }
            .padding()
            .onChange(of: viewModel.isLoggedIn) { isLoggedIn in
                if isLoggedIn {
                    navigateToHome = true
                }
            }
            .onOpenURL { url in
                // Xử lý URL từ Google Sign-In
                GIDSignIn.sharedInstance.handle(url)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
