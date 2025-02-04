//
//  Splash.swift
//  Take Profit
//
//  Created by Shabbir Rajput on 29/01/25.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        NavigationStack{
        GeometryReader { geometry in
            Spacer().frame(height: geometry.size.height * 0.5)
        }
            Image(uiImage: UIImage(named: AppAssets.splashAppIcon) ?? UIImage())
            .imageScale(.large)
            .foregroundStyle(.tint)
        
        ZStack {
            Image(uiImage: UIImage(named: AppAssets.splashBg) ?? UIImage())
            Text(AppStrings.loremIpsumIsSimplyDummyTextOfThePrinting).font(.system(size: 12))
        }.task {
            try? await Task.sleep(nanoseconds: 3_000_000_000) // 3 seconds delay
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: Onboarding())
                window.makeKeyAndVisible()
            }
        }
    }
    }
}

#Preview {
    Splash()
}
