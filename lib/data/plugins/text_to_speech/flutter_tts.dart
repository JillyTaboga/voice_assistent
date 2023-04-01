import 'package:flutter_tts/flutter_tts.dart' as tts;

import 'text_to_speech.dart';

class FlutterTts implements TextToSpeech {
  final _speaker = tts.FlutterTts();

  @override
  Future<void> initialize() async {
    await _speaker.setLanguage('pt-BR');
  }

  @override
  Future<void> speak(String text) async {
    await _speaker.speak(text);
  }
}
