//
//  AddPurchaseView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/30.
//

import SwiftUI

struct AddPurchaseView: View {
    @StateObject var spendViewModel: SpendViewModel
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                VStack(spacing: 20){
                    TextField("Name", text: $spendViewModel.purchaseName)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(Color.white.opacity(1))
                        .clipShape(Capsule())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    TextField("Amount", text: $spendViewModel.purchaseAmount)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(Color.white.opacity(1))
                        .clipShape(Capsule())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker(selection: $spendViewModel.purchaseDate, label: {
                        Text("Date:")
                    }).padding(.all, 10)

                }
                .padding(.all)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(30)
                Button(action: spendViewModel.addItem){
                    Text("Add Purchase")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.green)
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                }.padding(.top, 20)
                Button(action: spendViewModel.setAddItem){
                    Text("Cancel")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                }.padding(.top, 20)
                Spacer()
            }
            if(spendViewModel.isLoading){
                LoadingView()
            }
        }
    }
}

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView(spendViewModel: SpendViewModel())
    }
}
