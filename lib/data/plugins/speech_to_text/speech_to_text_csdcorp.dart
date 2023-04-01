import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'speech_to_text.dart';

class SpeechToTextCsdCorp implements SpeechToText {
  final _speechToText = stt.SpeechToText();

  @override
  Future<bool> speechActive() async {
    return await _speechToText.initialize();
  }

  @override
  void startListen(Function(String read) onRead, Function() onDone) {
    _speechToText.listen(
      onResult: (result) {
        onRead(result.recognizedWords);
        if (result.finalResult) {
          onDone();
        }
      },
    );
  }

  @override
  void stop() {
    _speechToText.cancel();
  }
}
