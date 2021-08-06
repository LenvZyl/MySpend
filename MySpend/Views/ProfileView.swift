//
//  ProfileView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/30.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Button(action: profileViewModel.toggleAlert){
                    Text("Cancel")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                }
                Spacer()
            }.blur(radius: profileViewModel.alert ? 30 : 0)
            if(profileViewModel.alert){
                AlertView(profileViewModel: profileViewModel)
            }
        }
    }
}

struct AlertView: View {
    @StateObject var profileViewModel: ProfileViewModel
    var body: some View {
        VStack {
            Image("wallet").resizable().frame(width: 50, height: 50).padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Spacer()
            Text("Hello").foregroundColor(Color.white)
            Spacer()
            Divider()
            HStack {
                Button("Close") {
                    profileViewModel.toggleAlert()
                }.frame(width: UIScreen.main.bounds.width/2-30, height: 40)
                .foregroundColor(.white)
                
                Button("Ok") {
                    profileViewModel.toggleAlert()
                }.frame(width: UIScreen.main.bounds.width/2-30, height: 40)
                .foregroundColor(.white)
            }
        }
        
        .frame(width: UIScreen.main.bounds.width/100 * 80, height: UIScreen.main.bounds.height/100 * 60)
        .background(Color.black.opacity(0.5).ignoresSafeArea(.all, edges: .all))
        .cornerRadius(20)
        .clipped()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
