//
//  common_button.swift
//  Take Profit
//
//  Created by Shabbir Rajput on 29/01/25.


import SwiftUI

struct CommonButton: View {
    var title: String
    var height: CGFloat?
    var width: CGFloat?
    var backgroundColor: Color?
    var cornerRadius: CGFloat?
    var textColor: Color?
    var font: Font?
    
//    var action: () -> Void
    
    var body: some View {
//        Button(action: action) {
            Text(title)
                .font(font ?? .system(size: 14))
                .foregroundColor(textColor ?? .white)
                .frame(height: height ?? 50)
                .frame(maxWidth: width ?? Double.infinity)
                .background(backgroundColor ?? Color.buttonBackgroundColor)
                .cornerRadius(cornerRadius ?? 25)
                .padding()
//        }
        .padding()
    }
}
