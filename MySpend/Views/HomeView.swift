//
//  HomeView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/29.
//

import SwiftUI

struct HomeView: View {
    
    func addItem(){
        
    }
    var body: some View {
        VStack{
            List{
                HStack{
                    Text("Name")
                    Spacer()
                    Text("$0.00")
                }
            }
            Spacer()
            Button(action: addItem){
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 80, height: 80)
            }.background(Color.green)
            .clipShape(Circle())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
