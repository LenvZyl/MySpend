//
//  ContentView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/28.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("is_logged_in") var isLoggedIn = false
    @StateObject var loginViewModel  = LoginViewModel()
    
    var body: some View {
        ZStack{
            if isLoggedIn {
                MainTabView(loginViewModel: loginViewModel)
            }else{
                LoginView(loginViewModel: loginViewModel)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
