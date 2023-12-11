# User Manual (ver 1)

## Feature 1 - Timer Display

**User Tutorial**
The main screen of the Pomodoro Timer displays the remaining time in minutes and seconds. This countdown starts from 25 minutes (default Pomodoro duration). When the timer is running, it counts down each second, providing a clear and precise indication of the time left in the current Pomodoro session.

**How it Works**
In the Flutter app, the timer display is managed by the `_PomodoroTimerState` class within PomodoroTimer.dart. The `remaining` variable holds the current duration, which starts at 25 minutes. The display format of minutes and seconds is implemented in the `Widget build` method, where the remaining time is formatted and shown on the screen.

## Feature 2 - Start Timer

**User Tutorial**
To start the Pomodoro timer, simply press the 'Start' button on the main screen. Once pressed, the countdown begins, ticking down from 25 minutes. This feature is useful for initiating focused work sessions, adhering to the Pomodoro technique.

**How it Works**
The start functionality is coded in the `startTimer` method of the `_PomodoroTimerState` class. When the 'Start' button is pressed, this method is triggered. It checks if a timer is already running; if not, it creates a new Timer instance that updates the remaining time every second. The timer updates the state of the application to reflect the time countdown.

## Feature 3 - Reset Timer

**User Tutorial**
To reset the timer to its original 25-minute duration, click the 'Reset' button. This action stops the ongoing countdown (if any) and resets the timer back to 25 minutes. It's particularly useful for starting a new Pomodoro session or aborting the current one.

**How it Works**
The reset functionality is encapsulated in the `stopTimer` method within the `_PomodoroTimerState` class. This method is called when the 'Reset' button is clicked. It cancels any active timer and resets the `remaining` duration to the initial 25 minutes. The application's state is then updated to reflect this reset.