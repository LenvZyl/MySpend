//
//  Purchase.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/30.
//

import Foundation


struct Purchase: Decodable, Identifiable, Hashable {
    let name: String
    let amount: Double
    let date: String
    let id: String
}
