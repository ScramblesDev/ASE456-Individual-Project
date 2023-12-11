import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> playAlarm() async {
    await audioPlayer.play(AssetSource('ring.mp3'));
  }
}
