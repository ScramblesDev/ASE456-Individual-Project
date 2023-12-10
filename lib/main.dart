import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(PomodoroApp());

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Pomodoro Timer',
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
  static const duration = Duration(minutes: 25);
  Timer? timer;
  Duration remaining = duration;

  void startTimer() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        setState(() {
          final seconds = remaining.inSeconds - 1;
          if (seconds < 0) {
            timer?.cancel();
          } else {
            remaining = Duration(seconds: seconds);
          }
        });
      });
    }
  }

  void stopTimer() {
    setState(() {
      timer?.cancel();
      remaining = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Pomodoro Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${remaining.inMinutes}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: startTimer,
              child: Text('Start'),
            ),
            ElevatedButton(
              onPressed: stopTimer,
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
