
import SwiftUI

struct Onboarding: View {
    let images = [AppAssets.onboarding1, AppAssets.onboarding2, AppAssets.onboarding3]
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentIndex) {
                    ForEach(0..<images.count, id: \.self) { index in
                        ZStack {
                            Image(images[index])
                                .resizable()
                                .scaledToFit()
                                .tag(index)
                                .padding(.all, 20)
                                .background {
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color.carouselBackgroundColor)
                                }
                                .rotationEffect(
                                    .degrees(
                                        currentIndex == index
                                        ? 0 : index > currentIndex ? 10 : -10))
                        }
                        .frame(height: 350)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 350)
                .onAppear {
                    startAutoSwipe()
                }
                .onDisappear {
                    stopAutoSwipe()
                }
                
                // Dot indicators
                HStack {
                    ForEach(0..<images.count, id: \.self) { index in
                        Capsule()
                            .fill(currentIndex == index ? Color.buttonBackgroundColor : Color.buttonBackgroundColor.opacity(0.4))
                            .frame(width: currentIndex == index ? 30 : 10, height: 10)
                    }
                }
                .padding()
                
                // Title Text
                Text(AppStrings.simpleWayToInvestYourMoney).font(.system(size:28)).multilineTextAlignment(.center).fontWeight(.bold).foregroundColor(Color.clr1D0330).padding()
                
                // Sub Title Text
                Text(AppStrings.loremIpsumIsSimplyDummyTextOfThePrintingAndTypesettingIndustry).font(.system(size:12)).multilineTextAlignment(.center).fontWeight(.regular).foregroundColor(Color.clr5B5B5B)
            }
            
            // Sign In Button
            NavigationLink(destination: LoginScreen()){
                CommonButton(title: AppStrings.signIn,
                             width: Double.infinity
                )
            }
        }
    }
    
    func startAutoSwipe() {
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
    }
    
    func stopAutoSwipe() {
        timer?.invalidate()
    }
}

#Preview {
    Onboarding()
}
