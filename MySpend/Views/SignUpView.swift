//
//  SignUpView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/29.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var loginViewModel: LoginViewModel
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                VStack(spacing: 20){
                    AuthTextField(text: $loginViewModel.emailSignUp, image: "person", placeHolder: "Email", isSecure: false)
                    AuthTextField(text: $loginViewModel.passwordSignUp, image: "lock", placeHolder: "Password", isSecure: true)
                    AuthTextField(text: $loginViewModel.passwordConfrimSignUp, image: "lock", placeHolder: "Confirm Password", isSecure: true)
                }
                .padding(.top)
                Button(action: loginViewModel.login){
                    Text("Create User")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                }.padding(.top, 20)
                Spacer(minLength: 0)
                HStack(spacing: 10){
                    Button(action: loginViewModel.setSignUp) {
                        Text("Back to Login")
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
        .alert(isPresented: $loginViewModel.alert, content: {
            Alert(title: Text("Alert"),
                  message: Text(loginViewModel.alertMessage),
                  dismissButton: .destructive(Text("Ok")))
        })
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(loginViewModel: LoginViewModel())
    }
}
