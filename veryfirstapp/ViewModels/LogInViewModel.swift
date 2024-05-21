//
//  LogInViewModel.swift
//  veryfirstapp
//
//  Created by SAKSHI GUPTA on 20/05/24.
//
import FirebaseAuth
import Foundation

class LogInViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){}
    func LogIn(){
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)  {
            [weak self] authResult, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
        }
        
    }
    private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage="Please fill in all fileds"
            return false
        }
        guard email.contains("@") && email.contains(".")else{
            errorMessage="Please enter valid Email"
            return false
        }
        return true
        
    }
}

