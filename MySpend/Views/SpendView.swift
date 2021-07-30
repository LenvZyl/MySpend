//
//  HomeView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/29.
//

import SwiftUI

struct SpendView: View {
    @StateObject var spendViewModel = SpendViewModel()
    var body: some View {
        VStack{
            ScrollView(.vertical) {
                ForEach(spendViewModel.purchases, id: \.self){ purchase in
                    HStack{
                        Text(purchase.name)
                        Spacer()
                        Text(String(format: "%.2f", purchase.amount))
                    }.frame(height: 50)
                    .cornerRadius(30)
                    .padding(.all, 10)
                }
            }
            Spacer()
            Button(action: spendViewModel.setAddItem){
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 80, height: 80)
            }.background(Color.green)
            .clipShape(Circle())
            .padding(.bottom, 10)
        }
        .fullScreenCover(isPresented: $spendViewModel.isAddingPurchase){
            AddPurchaseView(spendViewModel: spendViewModel)
        }
    }
}

struct SpendView_Previews: PreviewProvider {
    static var previews: some View {
        SpendView()
    }
}
