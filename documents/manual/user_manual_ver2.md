# User Manual (ver. 2)

## Feature 1 - Timer

**User Tutorial**
The timer in the Pomodoro app is designed to help you focus on tasks for a set duration. To start the timer, simply press the 'Start' button. The display shows the remaining time in minutes and seconds. If you wish to reset the timer, press the 'Reset' button, which stops the timer and resets it back to the initial 25-minute duration.

**How it Works**
The `TimerLogic` class manages the timer functionality. It utilizes a `Timer` object that updates every second. When the 'Start' button is pressed, the timer begins counting down from 25 minutes. The `remaining` variable tracks the time left. When the timer reaches zero, it stops automatically.

## Feature 2 - Progress Bar

**User Tutorial**
The progress bar visually represents the passage of time. It is located below the timer display. As the timer counts down, the filled portion of the progress bar increases from left to right, giving a quick visual reference of how much time has elapsed and how much remains.

**How it Works**
The progress bar is calculated based on the remaining time and the total duration (25 minutes). The `filledBarWidth` variable in `_PomodoroTimerState` class adjusts the width of the filled portion of the progress bar in relation to the total progress bar width, reflecting the proportion of time elapsed.

## Feature 3 - Fruit Changer

**User Tutorial**
This feature allows you to change the background image to different fruit images. Press the 'Change Fruit!' button to cycle through images of a tomato, pear, apple, lemon, orange, and cucumber. Each fruit selection changes the background color to match the fruit theme, enhancing the visual experience of the app.

**How it Works**
The `FruitManager` class manages the fruit-changing functionality. It holds a list of fruit images and their corresponding background colors. When the 'Change Fruit!' button is clicked, `currentImageIndex` is updated to show the next image and background color in the list.

## Feature 4 - Sound Effect

**User Tutorial**
When the timer reaches zero, a sound effect (ring.mp3) automatically plays to alert you. This feature helps in notifying you when the set time duration has ended, especially when you're not actively looking at the screen.

**How it Works**
The `AudioManager` class handles the sound functionality. It uses the `AudioPlayer` library to play 'ring.mp3' from the assets folder. The sound is triggered in the `updateUI` method of `_PomodoroTimerState` when the remaining time hits zero.