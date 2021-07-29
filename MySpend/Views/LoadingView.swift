//
//  LoadingView.swift
//  MySpend
//
//  Created by Len van Zyl on 2021/07/29.
//

import SwiftUI

struct LoadingView: View {
    @State var animation = false
    var body: some View {
        VStack{
            Circle().trim(from: 0, to: 0.7)
                .stroke(Color.red, lineWidth: 8)
                .frame(width: 80, height: 80)
                .rotationEffect(.init(degrees: animation ? 360 : 0))
                .padding(50)
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).ignoresSafeArea(.all, edges: .all))
        .onAppear(perform: {
            withAnimation(Animation.linear(duration: 1)){
                animation.toggle()
            }
        })
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
