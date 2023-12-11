import 'package:flutter/material.dart';
import 'TimerLogic.dart';
import 'AudioManager.dart';
import 'FruitManager.dart';

void main() => runApp(PomodoroApp());

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PomodoroTimer(),
    );
  }
}

class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  TimerLogic timerLogic = TimerLogic();
  AudioManager audioManager = AudioManager();
  FruitManager fruitManager = FruitManager();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double progressBarWidth = screenWidth * 0.5;
    double filledBarWidth =
        (timerLogic.remaining.inSeconds / TimerLogic.duration.inSeconds) *
            progressBarWidth;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
      ),
      backgroundColor: fruitManager.getBackgroundColor(),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(fruitManager.getCurrentImage()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      fruitManager.changeImage();
                    });
                  },
                  child: Text('Change Fruit!'),
                ),
                Text(
                  '${timerLogic.remaining.inMinutes}:${(timerLogic.remaining.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () => timerLogic.startTimer(updateUI),
                  child: Text('Start'),
                ),
                ElevatedButton(
                  onPressed: () => timerLogic.stopTimer(updateUI),
                  child: Text('Reset'),
                ),
                SizedBox(height: 20),
                Container(
                  width: progressBarWidth,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: filledBarWidth,
                    height: 20,
                    decoration: BoxDecoration(
                      //this looks prettier
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void updateUI() {
    setState(() {
      if (timerLogic.remaining == Duration.zero) {
        audioManager.playAlarm();
      }
    });
  }
}
