import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data_sources/chat_gpt_api.dart';
import 'plugins/speech_to_text/speech_to_text.dart';
import 'plugins/speech_to_text/speech_to_text_csdcorp.dart';
import 'plugins/text_to_speech/flutter_tts.dart';

final speechToText = Provider<SpeechToText>((ref) {
  return SpeechToTextCsdCorp();
});

final chatApi = Provider((ref) => ChatGptApi());

final textToSpeech = Provider((ref) => FlutterTts());
