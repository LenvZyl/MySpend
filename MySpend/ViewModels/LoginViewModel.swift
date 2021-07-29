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
    @Published var emailSignUp = ""
    @Published var passwordSignUp = ""
    @Published var passwordConfrimSignUp = ""
    @Published var isLoading = false
    @Published var isSignUp = false
    
    @Published var alertMessage = ""
    @Published var alert = false
    
    @AppStorage("is_logged_in") var isLoggedIn = false
    
    func login(){
        if(email.isEmpty || password.isEmpty){
            self.setAlert(message: "Please enter a valid email and password")
            return
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
        resetData()
        self.isSignUp.toggle()
    }
    
    func resetPassword(){
        
    }
    
    func signUp(){
        if(emailSignUp.isEmpty || passwordSignUp.isEmpty || passwordConfrimSignUp.isEmpty){
            self.setAlert(message: "Please enter a valid email and password")
            return
        }
        if(passwordSignUp != passwordConfrimSignUp){
            self.setAlert(message: "Passwords do not match")
            return
        }
        self.isLoading.toggle()
        Auth.auth().createUser(withEmail: emailSignUp, password: passwordSignUp) { [weak self] (user, error) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.isLoading.toggle()
            if(error != nil){
                strongSelf.setAlert(message: error!.localizedDescription)
                return
            }
            guard let registeredUser = user else {
                return
            }
            strongSelf.isLoading.toggle()
            registeredUser.user.sendEmailVerification(completion: {(err) in
                strongSelf.isLoading.toggle()
                if(err != nil){
                    strongSelf.setAlert(message: err!.localizedDescription)
                    return
                }
                strongSelf.setAlert(message: "Check your inbox to verify your user!")
            })
           
            
        }
    }
    func resetData(){
        email = ""
        password = ""
        emailSignUp = ""
        passwordSignUp = ""
        passwordConfrimSignUp = ""
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.isLoggedIn = false
            resetData()
        }catch {
            
        }
    }
}
