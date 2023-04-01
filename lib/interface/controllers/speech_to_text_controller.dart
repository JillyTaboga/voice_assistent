import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources_injection.dart';

part 'speech_to_text_controller.g.dart';

final isSpeechAvaibleProvider = FutureProvider.autoDispose<bool>((ref) async {
  final plugin = ref.read(speechToText);
  ref.onDispose(() => plugin.stop());
  return await plugin.speechActive();
});

@riverpod
class TextReadedProvider extends _$TextReadedProvider {
  @override
  String build() => '';

  setText(String newText) {
    state = newText;
  }

  clear() => state = '';
}

@riverpod
class IsRecording extends _$IsRecording {
  @override
  bool build() => false;

  change() => state = !state;
}
