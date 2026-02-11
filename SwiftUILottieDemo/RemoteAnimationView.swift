//
        //
    //  Project: SwiftUILottieDemo
    //  File: RemoteAnimationView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    


import SwiftUI
import Lottie // Import Lottie for remote animation loading

struct RemoteAnimationView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Remote Animation")
                .font(.headline)

            // Load animation asynchronously from a URL
            // The closure runs on a background thread
            // LottieView shows nothing until the download completes
            LottieView {
                // Await the async download and parse
                try await LottieAnimation.loadedFrom(
                    url: URL(string: "https://assets2.lottiefiles.com/packages/lf20_V9t630.json")!
                )
            }
            .playing()   // Auto-play once loaded
            .looping()   // Loop continuously
            .frame(width: 250, height: 250)
        }
        .padding()
    }
}

#Preview{
    RemoteAnimationView()
}
