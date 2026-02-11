//
        //
    //  Project: SwiftUILottieDemo
    //  File: FormSubmitView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    


import SwiftUI
import Lottie // Import Lottie for success animation

struct FormSubmitView: View {
    // Form input state
    @State private var email = ""
    // Controls whether success animation overlay is visible
    @State private var showSuccess = false
    // Controls the Lottie playback
    @State private var playbackMode: LottiePlaybackMode = .paused

    var body: some View {
        ZStack {
            // MARK: - Form Content
            VStack(spacing: 24) {
                Text("Subscribe to Newsletter")
                    .font(.title2.bold())

                // Simple email text field
                TextField("Enter your email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal)

                // Submit button triggers the success animation
                Button("Subscribe") {
                    // Simulate a form submission
                    showSuccess = true
                    playbackMode = .playing(
                        .fromProgress(0, toProgress: 1, loopMode: .playOnce)
                    )
                }
                .buttonStyle(.borderedProminent)
                .disabled(email.isEmpty)
            }
            .padding()
            // Dim the form when success overlay is showing
            .opacity(showSuccess ? 0.3 : 1.0)

            // MARK: - Success Animation Overlay
            if showSuccess {
                VStack(spacing: 16) {
                    // Play the success checkmark animation
                    LottieView(animation: .named("success"))
                        .playbackMode(playbackMode)
                        .animationDidFinish { completed in
                            if completed {
                                // Wait 1 second then dismiss the overlay
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation {
                                        showSuccess = false
                                        playbackMode = .paused
                                        email = ""  // Reset the form
                                    }
                                }
                            }
                        }
                        .frame(width: 200, height: 200)

                    Text("Subscribed!")
                        .font(.headline)
                        .foregroundStyle(.green)
                }
                .transition(.opacity)  // Fade in/out
            }
        }
        .animation(.easeInOut, value: showSuccess)
    }
}

#Preview {
    FormSubmitView()
}
