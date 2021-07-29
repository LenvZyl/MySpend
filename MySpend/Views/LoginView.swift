//
//  LoginView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/29.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel: LoginViewModel
    var body: some View {
        ZStack{
            VStack{
                Spacer(minLength: 0)
                ZStack{
                    if UIScreen.main.bounds.height < 750 {
                        Image(systemName: "person").resizable().frame(width: 100, height: 100)
                    } else {
                        Image(systemName: "logo").resizable().frame(width: 100, height: 100)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
                .padding(.top)
                VStack(spacing: 4){
                    HStack(spacing: 0){
                        Text("My Spending")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundColor(.white)
                        Text("Tracker")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundColor(.white)
                    }
                    Text("Keep track of your spending")
                        .font(.system(size: 12))
                        .foregroundColor(Color.black.opacity(0.3))
                }
                .padding(.top)
                VStack(spacing: 20){
                    LoginTextField(text: $loginViewModel.email, image: "person", placeHolder: "Email", isSecure: false)
                    LoginTextField(text: $loginViewModel.password, image: "lock", placeHolder: "Password", isSecure: true)
                }
                .padding(.top)
                Button(action: loginViewModel.login){
                    Text("Login")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                }.padding(.top, 20)
                
                HStack(spacing: 10){
                    Button(action: loginViewModel.setSignUp) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }.padding(.top, 20)
                Spacer(minLength: 0)
                
                HStack(spacing: 10){
                    Button(action: loginViewModel.resetPassword) {
                        Text("Forgot Password")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }.padding(.top, 20)
                
            }
            if(loginViewModel.isLoading){
                LoadingView()
            }
        }

        .background(LinearGradient(
                                gradient: Gradient(colors: [Color.white, Color.blue]),
                                   startPoint: .top,
                                   endPoint: .bottom).ignoresSafeArea(.all, edges: .all))
        .fullScreenCover(isPresented: $loginViewModel.isSignUp){
            SignUpView()
        }
        .alert(isPresented: $loginViewModel.alert, content: {
            Alert(title: Text("Alert"),
                  message: Text(loginViewModel.alertMessage),
                  dismissButton: .destructive(Text("Ok")))
        })
    }
}

struct LoginTextField: View {
    
    @Binding var text: String
    var image: String
    var placeHolder: String
    var isSecure: Bool
    
    var body: some View {
         ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(.accentColor)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
            if isSecure {
                SecureField(placeHolder, text: $text)
                .padding(.horizontal)
                .padding(.leading, 65)
                .frame(height: 60)
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
                .autocapitalization(.none)
            }else{
                TextField(placeHolder, text: $text)
                .padding(.horizontal)
                .padding(.leading, 65)
                .frame(height: 60)
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
                .autocapitalization(.none)
            }
         }).padding(.horizontal)
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginViewModel: LoginViewModel())
    }
}
