//
//  RegisterViewModel.swift
//  veryfirstapp
//
//  Created by SAKSHI GUPTA on 23/05/24.
//

import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject{
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func signIn(){
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password)
        {
            [weak self] Authresult, error in
            guard let userId = Authresult?.user.uid else {
                return
            }
            print("signed in")
            self?.insertUserRecord(id: userId)
        }
        
    }
    
    private func insertUserRecord(id: String){}
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid Email"
            return false
        }
        guard validatePassword(password) else {
            errorMessage = "Please enter valid password"
            return false
        }
        
        return true
    }
    private func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^.{6,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }
}
