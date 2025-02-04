//
//  otp_verification.swift
//  Take Profit
//
//  Created by Shabbir Rajput on 03/02/25.
//

import SwiftUI

struct OtpVerification: View {
    var mobileNumber: String
    @State private var otpDigits: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    @State private var timeRemaining = 30
    @State private var isTimerRunning = true
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(AppAssets.crossIcon).onTapGesture {
                        dismiss()
                    }.padding()
                    Spacer()
                }
                
                /// OTP Verify Text
                Text(AppStrings.otpVerify)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(Color.clr1D0330)
                    .padding(.horizontal)
                
                // OTP Has Sent To Your Number Text
                Text(AppStrings.OtpHasSentToYourMobileNumber)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color.clr5B5B5B)
                    .padding()
                
                HStack {
                    /// Mobile Number Text
                    Text(mobileNumber) // Use the passed mobileNumber
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(Color.clr1D0330)
                        .padding(.horizontal)
                    Image(AppAssets.editIcon)
                }
                
                // OTP Fields
                HStack(spacing: 10) {
                    ForEach(0..<6, id: \.self) { index in
                        TextField("", text: $otpDigits[index])
                            .frame(width: 50, height: 50)
                            .background(
                                otpDigits[index].isEmpty ? Color.white : Color.clr7063BF
                            )
                            .foregroundColor(.white)
                            .font(.system(size: 19))
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(focusedField == index ? Color.clr7063BF : Color.clrE8E8EC, lineWidth: 2)
                            )
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .focused($focusedField, equals: index)
                            .onChange(of: otpDigits[index]) { newValue in
                                // Limit input to one character
                                if newValue.count > 1 {
                                    otpDigits[index] = String(newValue.prefix(1))
                                }
                                
                                // Move to the next field when a character is entered
                                if newValue.count == 1 && index < 5 {
                                    focusedField = index + 1
                                }
                                
                                // Move to the previous field when a character is deleted
                                if newValue.isEmpty && index > 0 {
                                    focusedField = index - 1
                                }
                            }
                    }
                }
                .padding()
                .onAppear {
                    // Set initial focus to the first field
                    focusedField = 0
                }
                
                // Resend Code In Text
                Text(AppStrings.resendCodeIn)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color.clr5B5B5B)
                    .padding()
                
                // Resend Code Timer In Text
                Text(timeRemaining > 0 ? (timeRemaining < 10 ? "0\(timeRemaining)" : "\(timeRemaining)") : "0")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color.clr5B5B5B)
                    .padding()
                
                HStack {
                    // Don't Recieve Code? Text
                    Text(AppStrings.dontReceiveCode)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(Color.clr5B5B5B)
                    
                    // RESEND Text
                    Text(AppStrings.resend)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(Color.buttonBackgroundColor)
                        .underline()
                        .onTapGesture {
                            restartTimer()
                        }
                }
                
                Spacer()
                
                // Verify Button
                CommonButton(title: AppStrings.verify)
            }
            .onAppear {
                startTimer()
            }
        }.navigationBarBackButtonHidden(true)
    }

    /// Starts the timer for 30 seconds
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                isTimerRunning = false
            }
        }
    }

    /// Restart the timer when OTP is resent
    private func restartTimer() {
        timeRemaining = 30
        isTimerRunning = true
        startTimer()
    }
}

#Preview {
    OtpVerification(mobileNumber: "+965 - 2601 0848")
}
