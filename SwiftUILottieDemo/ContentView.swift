//
        //
    //  Project: SwiftUILottieDemo
    //  File: ContentView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import Lottie

struct ContentView: View {
    // State property controls animation playback
    @State private var playbackMode: LottiePlaybackMode = .paused
    
    var body: some View {
        VStack(spacing: 30) {
            // Animation controlled by playbackMode state
            LottieView(animation: .named("heart"))
                .playbackMode(playbackMode)
                .resizable()
                .frame(width: 300, height: 300)
            
            // Buttons to demonstrate different playback modes
            HStack(spacing: 20) {
                // Play once from start to finish
                Button("Play Once") {
                    playbackMode = .playing(
                        .fromProgress(0, toProgress: 1, loopMode: .playOnce)
                    )
                }
                .buttonStyle(.borderedProminent)
                
                // Loop continuously
                Button("Loop") {
                    playbackMode = .playing(
                        .fromProgress(0, toProgress: 0.5, loopMode: .loop)
                    )
                }
                .buttonStyle(.bordered)
                
                // Pause animation at current frame
                Button("Pause") {
                    playbackMode = .paused
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
