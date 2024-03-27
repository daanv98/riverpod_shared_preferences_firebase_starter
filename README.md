# Flutter Starter App with Riverpod, Shared Preferences, and Firebase

A starter project for a Flutter app which utilizes Riverpod for state management, Shared Preferences for theme settings persistence and Firebase for user authentication.

## Features
- Riverpod for state management
- Light and dark theme support
- Shared Preferences to retain theme settings across sessions
- Firebase Authentication integration

## Setup
1. Clone the repository.
2. Run `flutter pub get` to install dependencies. After this step, the app can be run. For full functionality, follow the additional steps below:
3. Create a Firebase project in the [console](https://console.firebase.google.com/) and configure Firebase for the app using the [Firebase CLI](https://firebase.google.com/docs/flutter/setup?platform=android).
4. Set up Firebase Authentication in the Firebase project and add the Email/Password sign-in provider.
5. Add an Email/Password user in the Firebase project.
6. Complete the two TODOs in the `lib/main.dart` file to initialize Firebase and adjust the initial screen. 
7. Complete the two TODOs in the `lib/views/pages/home/home_page.dart` file to use Firebase Authentication in the home page.
