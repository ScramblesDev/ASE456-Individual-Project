# Design Document (ver. 2)

## Overview
This document outlines the design for the Pomodoro timer app built using Flutter. The app features a timer display, fruit-themed backgrounds, audio alerts, and buttons to control the timer.

## Components
The app is divided into multiple main components:
- PomodoroApp: The main application component.
- PomodoroTimer: A StatefulWidget that manages the timer and UI.
- TimerLogic: Manages the countdown timer logic.
- AudioManager: Handles playing audio alerts.
- FruitManager: Manages fruit-themed backgrounds.

### PomodoroApp
- Type: StatelessWidget
- Responsibilities:
    - Initialize the app with theme and title.
    - Set the home screen (PomodoroTimer).

### PomodoroTimer
- Type: StatefulWidget
- Responsibilities:
    - Instantiate TimerLogic, AudioManager, and FruitManager.
    - Build the UI with timer display, control buttons, and dynamic backgrounds.

### TimerLogic
- Type: Class
- Properties:
    - timer: A Timer object for countdown management.
    - remaining: Duration to track the remaining time.
- Methods:
    - startTimer(): Starts the countdown timer.
    - stopTimer(): Stops and resets the timer.

### AudioManager
- Type: Class
- Methods:
    - playAlarm(): Plays an alarm sound when the timer reaches zero.

### FruitManager
- Type: Class
- Properties:
    - images: List of fruit-themed background images.
    - currentImageIndex: Index of the current background image.
- Methods:
    - getCurrentImage(): Retrieves the current background image.
    - getBackgroundColor(): Determines the background color based on the current image.
    - changeImage(): Changes the current image to the next in the list.

## User Interface
- Timer Display: Shows the remaining time in minutes and seconds.
- Fruit Background: Displays a fruit-themed background image that changes upon interaction.
- Start Button: Starts the countdown timer.
- Reset Button: Stops the timer and resets it to the initial duration.
- Change Fruit Button: Changes the background image.

## Functionality
- The app displays a timer set to 25 minutes with a fruit-themed background.
- The user can start, pause, and reset the timer.
- An alarm sound plays when the timer reaches zero.
- The background image and color theme change as the user interacts with the 'Change Fruit' button.
