import 'dart:async';

class TimerLogic {
  static const duration = Duration(minutes: 25);
  Timer? timer;
  Duration remaining = duration;

  void startTimer(Function updateUI) {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        final seconds = remaining.inSeconds - 1;
        if (seconds < 0) {
          timer?.cancel();
        } else {
          remaining = Duration(seconds: seconds);
        }
        updateUI();
      });
    }
  }

  void stopTimer(Function updateUI) {
    timer?.cancel();
    remaining = duration;
    updateUI();
  }
}
