import 'package:just_audio/just_audio.dart';

class AudioManager {
  static AudioPlayer? _player;

  static Future<void> initialize() async {
    _player = AudioPlayer();
  }

  static Future<void> playWelcomeSound() async {
    // TODO: Load and play welcome sound from assets
    // await _player?.setAsset('assets/sounds/welcome.mp3');
    // await _player?.play();
  }

  static Future<void> playAlarmSound() async {
    // TODO: Load and play alarm sound
  }

  static void dispose() {
    _player?.dispose();
  }
}