Overview

The Pomodoro Timer App is a Flutter-based application designed to enhance productivity using the Pomodoro technique. It features a customizable timer with a progress bar, a dynamic background that changes with different fruit themes, and an audio alert system. This application is ideal for individuals looking to improve focus and manage their time more effectively.

Features
- Timer Functionality: A 25-minute countdown timer to promote focused work sessions.
- Progress Bar: Visual representation of time elapsed and time remaining in the work session.
- Fruit Theme Background Changer: Allows users to change the background image to various fruit themes, enhancing the visual appeal and user experience.
- Audio Alert: Plays a sound when the timer reaches zero, notifying the user that the session has ended.

Installation

To use the Pomodoro Timer App, follow these steps:

- Clone the repository: git clone [repository URL]
- Navigate to the cloned directory.
- Ensure Flutter is installed on your system. If not, install Flutter from the official Flutter website.
- Run "flutter create ." to run this in a new flutter project
- Run the app using Flutter: flutter run

Usage

Upon launching the app, you will see a simple user interface with the timer, progress bar, and control buttons:
- Press 'Start' to begin the timer.
- Use the 'Reset' button to stop and reset the timer.
- Click on 'Change Fruit!' to cycle through different fruit-themed backgrounds.

Main Project Structure
- /lib:
    - main.dart: The entry point of the application.
    - TimerLogic.dart: Manages the timer's logic and state.
    - AudioManager.dart: Handles playing the audio alert.
    - FruitManager.dart: Manages the fruit-themed backgrounds and associated colors.
- /assets:
    - Images (.png): Fruit images used for the background.
    - Sound file (ring.mp3): Audio file played when the timer ends.

Dependencies
- Flutter SDK
- Dart
- audioplayers package for audio playback.