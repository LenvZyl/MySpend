//
//  LoginViewModel.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/29.
//

import Foundation
import FirebaseAuth
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var isSignUp = false
    
    @Published var alertMessage = ""
    @Published var alert = false
    
    @AppStorage("is_logged_in") var isLoggedIn = false
    
    func login(){
        if(email.isEmpty || password.isEmpty){
            self.setAlert(message: "Please enter a valid email and password")
        }
        self.isLoading.toggle()
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.isLoading.toggle()
            if(error != nil){
                strongSelf.setAlert(message: error!.localizedDescription)
                return
            }
            guard let _ = Auth.auth().currentUser else {
                strongSelf.setAlert(message: "User not found")
                return
            }
            strongSelf.isLoggedIn = true
            
        }
        
        
    }
    func setAlert(message: String){
        alert.toggle()
        self.alertMessage = message
    }
    
    func setSignUp(){
        self.isSignUp.toggle()
    }
    
    func resetPassword(){
        
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.isLoggedIn = false
        }catch {
            
        }
    }
}
