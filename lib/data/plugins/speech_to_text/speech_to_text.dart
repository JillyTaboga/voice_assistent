abstract class SpeechToText {
  Future<bool> speechActive();
  void stop();
  void startListen(Function(String read) onRead, Function() onDone);
}
