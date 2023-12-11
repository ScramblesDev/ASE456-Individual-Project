import 'package:flutter_test/flutter_test.dart';
import 'package:ASE456-Individual-Project/TimerLogic.dart';

void main() {
  group('TimerLogic Tests', () {
    final timerLogic = TimerLogic();

    test('Initial duration should be 25 minutes', () {
      expect(timerLogic.remaining, Duration(minutes: 25));
    });

    test('Stopping the timer should reset the duration', () {
      timerLogic.stopTimer(() {});
      expect(timerLogic.remaining, Duration(minutes: 25));
    });
  });
}
