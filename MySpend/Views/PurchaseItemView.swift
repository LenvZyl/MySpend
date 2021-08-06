//
//  PurchaseItemView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/30.
//

import SwiftUI

struct PurchaseItemView: View {
    let purchase: Purchase
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(purchase.name)
                Spacer()
                Text(purchase.date)
                    .foregroundColor(.accentColor.opacity(0.9)).font(.system(size: 12))
            }.padding(.leading, 20)
            Spacer()
            Text(String(format: "%.2f", purchase.amount))
        }.frame(height: 50)
        .padding(.all, 10)
        .background(Color.blue.opacity(0.2)).clipShape(Capsule())
    }
}

struct PurchaseItemView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseItemView(purchase: Purchase(name: "Name", amount: 1.00, date: "Date", id: "Id"))
    }
}
