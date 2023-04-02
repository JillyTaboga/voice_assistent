abstract class TextToSpeech {
  Future<void> initialize();
  Future<void> speak(String text);
  void stop();
}
