//
//  sign_up.swift
//  Take Profit
//
//  Created by Shabbir Rajput on 30/01/25.
//

import SwiftUI

struct SignUp: View {
    @State private var recommendorName: String = ""
    @State private var mobileNumber: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var isNewPasswordSecure: Bool = true
    @State private var isConfirmPasswordSecure: Bool = true
    @State private var isTermsAndConditionsChecked: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                // Top Back Button
                Image(AppAssets.backIcon).padding().onTapGesture {
                    dismiss()
                }
                
                Text(AppStrings.signUp).font(.system(size:20)).fontWeight(.medium).foregroundColor(Color.buttonBackgroundColor)
                    .padding(.horizontal)
                
                // Horizontal Line
                HStack {
                    Rectangle()
                        .frame(height: 3)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.buttonBackgroundColor)
                    
                    Rectangle()
                        .frame(height: 0.5)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.clr8F8F8F)
                }.padding()
                
                // Recommender Name Text
                HStack{
                    Image(AppAssets.personIcon)
                    Text(AppStrings.nameOfRecommender).font(.system(size: 12)).multilineTextAlignment(.center).fontWeight(.medium).foregroundColor(Color.clr1D0330)
                }.padding(.horizontal)
                
                // Name Of Recommendor Text Field
                TextField(AppStrings.enterNameOfRecommender, text: $recommendorName)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(red: 0xE8 / 255, green: 0xE8 / 255, blue: 0xEC / 255), lineWidth: 1)
                    )
                    .cornerRadius(30)
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
                            .stroke(Color(red: 0xE8 / 255, green: 0xE8 / 255, blue: 0xEC / 255), lineWidth: 1)
                    )
                    .cornerRadius(30)
                    .padding()
                
                // New Password Text
                HStack{
                    Image(AppAssets.lockIcon)
                    Text(AppStrings.newPassword).font(.system(size: 12)).multilineTextAlignment(.center).fontWeight(.medium).foregroundColor(Color.clr1D0330)
                }.padding(.horizontal)
                
                // New Password Text Field
                HStack {
                    if isNewPasswordSecure {
                        SecureField(AppStrings.enterNewPassword, text: $newPassword)
                    } else {
                        TextField(AppStrings.enterNewPassword, text: $newPassword)
                    }
                    
                    Button(action: {
                        isNewPasswordSecure.toggle()
                    }) {
                        Image(systemName: isNewPasswordSecure ? AppAssets.eyeSlash : AppAssets.eye)
                            .foregroundColor(Color.buttonBackgroundColor)
                    }
                }
                .padding()
                .frame(width: 350, height: 50)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .cornerRadius(30)
                .padding()
                
                // Confirm Password Text
                HStack{
                    Image(AppAssets.lockIcon)
                    Text(AppStrings.confirmPassword).font(.system(size: 12)).multilineTextAlignment(.center).fontWeight(.medium).foregroundColor(Color.clr1D0330)
                }.padding(.horizontal)
                
                // Confirm Password Text Field
                HStack {
                    if isConfirmPasswordSecure {
                        SecureField(AppStrings.enterConfirmPassword, text: $confirmPassword)
                    } else {
                        TextField(AppStrings.enterConfirmPassword, text: $confirmPassword)
                    }
                    
                    Button(action: {
                        isConfirmPasswordSecure.toggle()
                    }) {
                        Image(systemName: isConfirmPasswordSecure ? AppAssets.eyeSlash : AppAssets.eye)
                            .foregroundColor(Color.buttonBackgroundColor)
                    }
                }
                .padding()
                .frame(width: 350, height: 50)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .cornerRadius(30)
                .padding()
                
                // Accept Terms & Conditions Text
                HStack {
                    Image(isTermsAndConditionsChecked ? AppAssets.checkboxSelected : AppAssets.checkboxUnselected)
                        .padding(.horizontal)
                        .onTapGesture {
                            if(isTermsAndConditionsChecked == false){
                                isTermsAndConditionsChecked = true
                            }else{
                                isTermsAndConditionsChecked = false
                            }
                        }
                    Text(AppStrings.accept).font(.system(size:12)).fontWeight(.medium).foregroundColor(Color.clr1D0330)
                    
                    
                    Text(AppStrings.termsAndCondition).font(.system(size:12)).fontWeight(.medium).foregroundColor(Color.buttonBackgroundColor).underline()
                    
                    
                    Spacer()
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
                
                Spacer()
                
                // Send OTP Button
                NavigationLink(value: mobileNumber) {
                    CommonButton(title: "Send OTP")

                }
                .navigationDestination(for: String.self) { mobileNumber in
                    OtpVerification(mobileNumber: mobileNumber)
                }
            }.padding()
        }.navigationBarBackButtonHidden(true)
    }
}


#Preview {
    SignUp()
}
