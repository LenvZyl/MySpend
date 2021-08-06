//
//  ProfileViewModel.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/30.
//

import Foundation


class ProfileViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var alert = false
    
    
    func toggleAlert(){
        alert.toggle()
    }
    
    func shuf(){
        var code = "abc-def"
        var codeArr = code.components(separatedBy: "-")
        codeArr.shuffle()
        var mixedArr: [[String]] = []
        for item in codeArr {
            let arr = Array(item).shuffled()
            let rr = arr.compactMap{ string in
               return String(string)
            }
            mixedArr.append(rr)
        }
        var newarr = mixedArr.compactMap{ string in
             string.joined(separator: "")
        }
        var newCode = newarr.joined(separator: "-")
        print(newCode)
    }
}
