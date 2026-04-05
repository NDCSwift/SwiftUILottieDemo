# 🎬 Lottie Animations — SwiftUI Demo

A SwiftUI demo showing how to integrate and control Lottie animations in an iOS app — including playback control, looping, and triggering animations from SwiftUI state.

---

## 🤔 What this is

This project shows how to embed Lottie (the industry-standard animation format from Airbnb) into a SwiftUI app. It includes three ready-to-run animations — a heart, a success checkmark, and a subscribe animation — with examples of how to trigger, loop, and control them from SwiftUI views.

## ✅ Why you'd use it

- **Copy-paste Lottie integration** — the bridge between Lottie's `UIView`-based player and SwiftUI is already wired up
- **Three working animations included** — heart, success, and subscribe JSON files ready to run out of the box
- **State-driven playback** — see how to trigger animations from SwiftUI `@State` (e.g. on button tap)
- **No heavy setup** — one SPM package dependency and you're running

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/m9LUur5MQ18)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97). Subscribe for weekly SwiftUI tutorials.

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/SwiftUILottieDemo.git
cd SwiftUILottieDemo
```

### 2. Open in Xcode
Double-click `SwiftUILottieDemo.xcodeproj`.

### 3. Add Lottie via SPM
**File → Add Package Dependencies** → search for `github.com/airbnb/lottie-spm`

### 4. Set Your Development Team
**TARGET → Signing & Capabilities → Team**

### 5. Update the Bundle Identifier
Change `com.example.MyApp` to a unique identifier.

### 6. Run
Select a simulator or device and hit **Run**.

---

## 🛠️ Notes

- Lottie is added via Swift Package Manager — not included in the repo
- Animation JSON files (`heart.json`, `success.json`, `subscribe.json`) are included in the project
- If you see a code signing error, check that Team and Bundle ID are set

## 📦 Requirements

- Xcode 15+
- iOS 17+
- [Lottie SPM](https://github.com/airbnb/lottie-spm)
