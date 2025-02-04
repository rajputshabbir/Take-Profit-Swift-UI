//
//  app_colors.swift
//  Take Profit
//
//  Created by Shabbir Rajput on 29/01/25.
//


import SwiftUI

extension Color {
    static let primaryColor = Color.black
    static let secondaryColor = Color.blue
    static let backgroundColor = Color.white
    static let buttonBackgroundColor = Color(hex: "#7063BF")
    static let carouselBackgroundColor = Color(hex: "#D5CEFF").opacity(0.21)
    static let clr5B5B5B = Color(hex: "#5B5B5B")
    static let clr7063BF = Color(hex: "#7063BF")
    static let clrE8E8EC = Color(hex: "#E8E8EC")
    static let clrFCFCFC = Color(hex: "#FCFCFC")
    static let clrCFCFCF = Color(hex: "#CFCFCF")
    static let clr1D0330 = Color(hex: "#1D0330")
    static let clr8F8F8F = Color(hex: "#8F8F8F")
    
    /// Color from Hex
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        
        // Remove "#" if present
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        // Extract RGB values
        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        
        // Initialize Color
        self.init(red: red, green: green, blue: blue)
    }
}
