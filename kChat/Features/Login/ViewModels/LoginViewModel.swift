//
//  LoginViewModel.swift
//  kChat
//
//  Created by Kem on 2/3/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var isLoggedIn = false
    
    private let authService = AuthService.shared
    
    func login() {
        authService.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                self?.isLoggedIn = true
                self?.errorMessage = nil
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
    
    func loginWithGoogle() {
        authService.loginWithGoogle { [weak self] result in
            switch result {
            case .success:
                self?.isLoggedIn = true
                self?.errorMessage = nil
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
}
