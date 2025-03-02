//
//  AuthSerive.swift
//  kChat
//
//  Created by Kem on 2/3/25.
//

import FirebaseAuth
import GoogleSignIn
import FirebaseCore

class AuthService {
    static let shared = AuthService()
    
    // Đăng nhập bằng email/password (đã có từ trước)
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let user = result?.user {
                let appUser = User(uid: user.uid, email: user.email ?? "")
                completion(.success(appUser))
            }
        }
    }
    
    // Đăng nhập bằng Google
    func loginWithGoogle(completion: @escaping (Result<User, Error>) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Lấy root view controller từ cửa sổ hiện tại
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let firebaseUser = authResult?.user {
                    let appUser = User(uid: firebaseUser.uid, email: firebaseUser.email ?? "")
                    completion(.success(appUser))
                }
            }
        }
    }
}
