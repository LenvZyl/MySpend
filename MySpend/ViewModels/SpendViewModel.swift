//
//  SpendViewModel.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/30.
//

import Foundation
import SwiftUI


class SpendViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var isAddingPurchase = false
    
    @Published var purchaseName = ""
    @Published var purchaseAmount = ""
    @Published var purchaseDetail = ""
    
    @Published var purchases: [Purchase] = [
        Purchase(name: "Food", amount: 20.00, date: "", id: "1"),
        Purchase(name: "Fuel", amount: 40.00, date: "", id: "2"),
        Purchase(name: "Drink", amount: 30.00, date: "", id: "3"),
        Purchase(name: "Food", amount: 10.00, date: "", id: "4"),
    ]
    
    func setAddItem(){
        isAddingPurchase.toggle()
    }
    func addItem(){
        purchases.append(Purchase(name: purchaseName, amount: Double(purchaseAmount) ?? 0.0, date: purchaseDetail, id: "1"))
        clearData()
        isAddingPurchase.toggle()
    }
    func clearData(){
        purchaseName = ""
        purchaseAmount = ""
        purchaseDetail = ""
    }
}

