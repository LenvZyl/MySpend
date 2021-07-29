//
//  AuthTextField.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/29.
//

import SwiftUI

struct AuthTextField: View {
    @Binding var text: String
    var image: String
    var placeHolder: String
    var isSecure: Bool
    
    var body: some View {
         ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(.accentColor)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
            if isSecure {
                SecureField(placeHolder, text: $text)
                    .padding(.horizontal)
                    .padding(.leading, 65)
                    .frame(height: 60)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Capsule())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }else{
                TextField(placeHolder, text: $text)
                    .padding(.horizontal)
                    .padding(.leading, 65)
                    .frame(height: 60)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Capsule())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
         }).padding(.horizontal)
    }
}
