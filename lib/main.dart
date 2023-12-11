import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
  static const duration = Duration(minutes: 25);
  Timer? timer;
  Duration remaining = duration;
  AudioPlayer audioPlayer = AudioPlayer();

  // list of fruits and vegetables
  final List<String> images = [
    'tomato.png',
    'pear.png',
    'apple.png',
    'lemon.png',
    'orange.png',
    'cucumber.png'
  ];
  int currentImageIndex = 0;

  Color getBackgroundColor() {
    switch (images[currentImageIndex]) {
      case 'tomato.png':
      case 'apple.png':
        return Color.fromRGBO(255, 182, 193, 0.3); // light Pink
      case 'cucumber.png':
      case 'pear.png':
        return Color.fromRGBO(144, 238, 144, 0.3); // light Green
      case 'lemon.png':
        return Color.fromRGBO(255, 247, 153, 0.3); // light Yellow
      case 'orange.png':
        return Color.fromRGBO(255, 165, 0, 0.2); // light Orange
      default:
        return Colors.white;
    }
  }

  void startTimer() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        setState(() {
          final seconds = remaining.inSeconds - 1;
          if (seconds < 0) {
            timer?.cancel();
            playAlarm();
          } else {
            remaining = Duration(seconds: seconds);
          }
        });
      });
    }
  }

  void playAlarm() async {
    await audioPlayer.play(AssetSource('ring.mp3'));
  }

  void stopTimer() {
    setState(() {
      timer?.cancel();
      remaining = duration;
    });
  }

  void changeImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double progressBarWidth = screenWidth * 0.5;
    double filledBarWidth =
        (remaining.inSeconds / duration.inSeconds) * progressBarWidth;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
      ),
      backgroundColor: getBackgroundColor(),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(images[currentImageIndex]),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: changeImage,
                  child: Text('Change Fruit!'),
                ),
                Text(
                  '${remaining.inMinutes}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: startTimer,
                  child: Text('Start'),
                ),
                ElevatedButton(
                  onPressed: stopTimer,
                  child: Text('Reset'),
                ),
                SizedBox(height: 20),
                // The loading bar
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
                      color: Colors.white,
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
}
