//
//  login.swift
//  Take Profit
//
//  Created by Shabbir Rajput on 30/01/25.
//

import SwiftUI

struct LoginScreen: View {
    @State private var mobileNumber: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                // Top Back Button
                Image(AppAssets.backIcon).padding().onTapGesture {
                    dismiss()
                }
                
                Text(AppStrings.signIn).font(.system(size:20)).fontWeight(.medium).foregroundColor(Color.buttonBackgroundColor)
                    .padding(.horizontal)
                
                // Horizontal Line
                Rectangle()
                    .frame(height: 3)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.buttonBackgroundColor)
                    .padding()
                
                // Mobile Number Text
                HStack{
                    Image(AppAssets.phoneIcon)
                    Text(AppStrings.mobileNumber).font(.system(size: 12)).multilineTextAlignment(.center).fontWeight(.medium).foregroundColor(Color.clr1D0330)
                }.padding(.horizontal)
                
                // Mobile Number Text Field
                TextField(AppStrings.enterMobileNumber, text: $mobileNumber)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.clrE8E8EC, lineWidth: 1)
                    )
                    .cornerRadius(30)
                    .padding()
                
                // Password Text
                HStack{
                    Image(AppAssets.lockIcon)
                    Text(AppStrings.password).font(.system(size: 12)).multilineTextAlignment(.center).fontWeight(.medium).foregroundColor(Color.clr1D0330)
                }.padding(.horizontal)
                
                // Password Text Field
                HStack {
                    if isSecure {
                        SecureField(AppStrings.enterPassword, text: $password)
                    } else {
                        TextField(AppStrings.enterPassword, text: $password)
                    }
                    
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? AppAssets.eyeSlash : AppAssets.eye)
                            .foregroundColor(Color.buttonBackgroundColor)
                    }
                }
                .padding()
                .frame(width: 350, height: 50)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.clrE8E8EC, lineWidth: 1)
                )
                .cornerRadius(30)
                .padding()
                
                // Forgot Password Text
                HStack {
                    Spacer()
                    Text(AppStrings.forgotPassword).font(.system(size:12)).multilineTextAlignment(.center).fontWeight(.medium).foregroundColor(Color.buttonBackgroundColor)
                        .padding()
                }
                
                
                // Or Continue With Text
                HStack{
                    // Horizontal Line
                    Rectangle()
                        .frame(height: 3)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.clrE8E8EC)
                        .padding(.horizontal)
                    
                    Text(AppStrings.orContinueWith).font(.system(size:12)).fontWeight(.medium).foregroundColor(Color.clr5B5B5B)
                    
                    // Horizontal Line
                    Rectangle()
                        .frame(height: 3)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.clrE8E8EC)
                        .padding(.horizontal)
                }
                
                HStack{
                    Spacer()
                    SignUpWithIconButtons(image: AppAssets.googleIcon, onTapAction: {})
                    SignUpWithIconButtons(image: AppAssets.twitterIcon, onTapAction: {}).padding()
                    SignUpWithIconButtons(image: AppAssets.appleIcon, onTapAction: {})
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text(AppStrings.DontHaveAnAccount).font(.system(size:14)).fontWeight(.medium).foregroundColor(Color.clr5B5B5B)
                    
                    NavigationLink(destination: SignUp()){
                        Text(AppStrings.signUp).font(.system(size:14)).fontWeight(.medium).foregroundColor(Color.buttonBackgroundColor)
                    }
                    Spacer()
                }.padding(.horizontal)
                
                Spacer()
                
                // Sign In Button
                CommonButton(title: AppStrings.signIn)
            }.padding()
                .navigationBarBackButtonHidden(true)
        }
        
    }
}

#Preview {
    LoginScreen()
}


struct SignUpWithIconButtons: View {
    var image: String
    var onTapAction: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 41, height: 41)
                .foregroundColor(Color.white)
                .overlay(
                    Circle().stroke(Color(red: 0xE8 / 255, green: 0xE8 / 255, blue: 0xEC / 255), lineWidth: 1)
                )
                .onTapGesture {
                    onTapAction()
                }
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
        }
    }
}

