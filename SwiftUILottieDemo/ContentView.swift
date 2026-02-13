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
import Lottie // Import Lottie animation framework

// ============================================================
// MARK: - Main Content View
// Tab-based navigation showing all Lottie demos
// ============================================================
struct ContentView: View {
    var body: some View {
        TabView {
            // Tab 1: Basic looping animation
            BasicAnimationView()
                .tabItem {
                    Label("Basic", systemImage: "play.circle")
                }
            
            // Tab 2: Playback controls with speed slider
            PlaybackControlView()
                .tabItem {
                    Label("Controls", systemImage: "slider.horizontal.3")
                }
            
            // Tab 3: Interactive like button toggle
            LikeButtonView()
                .tabItem {
                    Label("Like", systemImage: "heart")
                }
            
            // Tab 4: Form submission with success overlay
            FormSubmitView()
                .tabItem {
                    Label("Form", systemImage: "checkmark.circle")
                }
            
            // Tab 5: Remote URL animation loading
            RemoteAnimationView()
                .tabItem {
                    Label("Remote", systemImage: "cloud.fill")
                }
        }
    }
}

// ============================================================
// MARK: - Basic Animation Demo
// Simplest possible Lottie implementation
// Animation: "heart" — any celebration/particle animation
// ============================================================
struct BasicAnimationView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Basic Lottie Animation")
                .font(.title2.bold())
            
            // Load local JSON by filename (no .json extension needed)
            // .playing() — starts animation on appear
            // .looping() — repeats indefinitely
            LottieView(animation: .named("heart"))
                .playing()
                .looping()
                .frame(width: 300, height: 300)
            
            Text("Confetti on loop")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

// ============================================================
// MARK: - Playback Control Demo
// Demonstrates play once, loop, pause, and speed control
// Animation: "subscribe" — any spinner/progress animation
// ============================================================
struct PlaybackControlView: View {
    // Playback mode drives the animation declaratively
    @State private var playbackMode: LottiePlaybackMode = .paused
    // Speed multiplier for the animation
    @State private var speed: Double = 1.0
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Playback Controls")
                .font(.title2.bold())
            
            // Animation responds to playbackMode state changes
            LottieView(animation: .named("subscribe"))
                .playbackMode(playbackMode)
                .animationSpeed(speed)
                .frame(width: 200, height: 200)
            
            // MARK: Playback Buttons
            HStack(spacing: 16) {
                // Play once — from start (0%) to end (100%)
                Button("Play Once") {
                    playbackMode = .playing(
                        .fromProgress(0, toProgress: 1, loopMode: .playOnce)
                    )
                }
                .buttonStyle(.borderedProminent)
                
                // Loop — continuous playback
                Button("Loop") {
                    playbackMode = .playing(
                        .fromProgress(0, toProgress: 1, loopMode: .loop)
                    )
                }
                .buttonStyle(.bordered)
                
                // Pause — freeze on current frame
                Button("Pause") {
                    playbackMode = .paused
                }
                .buttonStyle(.bordered)
            }
            
            // MARK: Speed Slider
            VStack {
                Text("Speed: \(speed, specifier: "%.1f")x")
                    .font(.subheadline)
                // Slider range from 0.25x to 3.0x
                Slider(value: $speed, in: 0.25...3.0, step: 0.25)
                    .padding(.horizontal, 40)
            }
        }
        .padding()
    }
}

// ============================================================
// MARK: - Like Button Demo
// Toggle animation forward (like) and reverse (unlike)
// Animation: "heart" — any heart/like toggle animation
// ============================================================
struct LikeButtonView: View {
    // Tracks liked/unliked state
    @State private var isLiked = false
    // Controls Lottie playback direction
    @State private var playbackMode: LottiePlaybackMode = .paused
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tap the heart!")
                .font(.title2.bold())
            
            // Heart animation — tappable with forward/reverse toggle
            LottieView(animation: .named("heart"))
                .playbackMode(playbackMode)
            // Pause when animation completes to hold final frame
                .animationDidFinish { completed in
                    if completed {
                        playbackMode = .paused
                    }
                }
                .frame(width: 150, height: 150)
                .onTapGesture {
                    if !isLiked {
                        // LIKE: Play forward (0% to 100%)
                        isLiked = true
                        playbackMode = .playing(
                            .fromProgress(0, toProgress: 1, loopMode: .playOnce)
                        )
                    } else {
                        // UNLIKE: Play reverse (100% to 0%)
                        isLiked = false
                        playbackMode = .playing(
                            .fromProgress(1, toProgress: 0, loopMode: .playOnce)
                        )
                    }
                }
            
            // Visual feedback of current state
            Text(isLiked ? "Liked ❤️" : "Not liked")
                .font(.headline)
                .foregroundStyle(isLiked ? .red : .secondary)
        }
        .padding()
    }
}

// ============================================================
// MARK: - Form Submit Demo
// Real-world use case: success overlay after submission
// Animation: "subscribe" — any checkmark/success animation
// ============================================================
struct FormSubmitView: View {
    // Form input
    @State private var email = ""
    // Controls success overlay visibility
    @State private var showSuccess = false
    // Controls the checkmark animation
    @State private var playbackMode: LottiePlaybackMode = .paused
    
    var body: some View {
        ZStack {
            // MARK: Form Content Layer
            VStack(spacing: 24) {
                Text("Subscribe to Newsletter")
                    .font(.title2.bold())
                
                // Email input field
                TextField("Enter your email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                
                // Submit triggers the success animation flow
                Button("Subscribe") {
                    showSuccess = true
                    playbackMode = .playing(
                        .fromProgress(0, toProgress: 1, loopMode: .playOnce)
                    )
                }
                .buttonStyle(.borderedProminent)
                .disabled(email.isEmpty)
            }
            .padding()
            // Dim form behind success overlay
            .opacity(showSuccess ? 0.3 : 1.0)
            
            // MARK: Success Overlay Layer
            if showSuccess {
                VStack(spacing: 16) {
                    // Checkmark plays once then holds
                    LottieView(animation: .named("subscribe"))
                        .playbackMode(playbackMode)
                        .animationDidFinish { completed in
                            if completed {
                                // Hold 1 second then dismiss and reset
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation {
                                        showSuccess = false
                                        playbackMode = .paused
                                        email = ""
                                    }
                                }
                            }
                        }
                        .frame(width: 200, height: 200)
                    
                    Text("Subscribed!")
                        .font(.headline)
                        .foregroundStyle(.green)
                }
                .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: showSuccess)
    }
}

// ============================================================
// MARK: - Remote Animation Demo
// Load animation from a URL instead of a local file
// Replace the URL with any Lottie Animation URL from LottieFiles
// (Detail page > Asset & Embed tab > copy the URL)
// ============================================================
struct RemoteAnimationView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Remote Animation")
                .font(.title2.bold())
            
            ZStack {
                // Placeholder while animation downloads
                ProgressView("Loading animation...")
                
                // Async initializer downloads and parses the JSON
                // Renders automatically once download completes
                LottieView {
                    // REPLACE this URL with your own from LottieFiles
                    // (Detail page > Asset & Embed tab > Lottie Animation URL)
                    try await LottieAnimation.loadedFrom(
                        url: URL(string: "REPLACE_WITH_YOUR_LOTTIEFILES_URL")!
                    )
                }
                .playing()
                .looping()
            }
            .frame(width: 250, height: 250)
            
            Text("Loaded from URL")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

// ============================================================
// MARK: - Preview
// ============================================================
#Preview {
    ContentView()
}
