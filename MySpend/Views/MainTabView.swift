//
//  MainTabView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/29.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection = 0
    @StateObject var loginViewModel: LoginViewModel
    
    var body: some View {
        
        TabView(selection: $selection) {
            NavigationView {
                SpendView()
                    .navigationTitle("Spend")
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Spend")
            }.tag(0)
            NavigationView {
                Text("")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .navigationTitle("Profile")
                    .toolbar {
                        Button("Log out") {
                            loginViewModel.signOut()
                        }
                    }
            }.tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }.tag(1)
            .onAppear() {
                UITabBar.appearance().barTintColor = .white
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(loginViewModel: LoginViewModel())
    }
}

