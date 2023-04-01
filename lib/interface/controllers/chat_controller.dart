import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources_injection.dart';
import '../../domain/entities/chat_entry.dart';
import '../../domain/use_case/get_response_use_case.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatList extends _$ChatList {
  @override
  List<ChatEntry> build() => [];

  addBubble(ChatEntry newEntry) async {
    if (newEntry.origin == ChatOrigem.user) {
      _getAnswer(newEntry.content);
    } else {
      ref.read(textToSpeech).speak(newEntry.content);
    }
    state = [newEntry, ...state];
  }

  _getAnswer(String question) async {
    ref.read(chatLoadingProvider.notifier).change(true);
    try {
      final answer =
          await ref.read(getResponseUseCaseProvider(question).future);
      addBubble(answer);
      ref.read(chatLoadingProvider.notifier).change(false);
    } on DioError catch (e) {
      ref.read(chatLoadingProvider.notifier).change(false);
      addBubble(
        ChatEntry(
          createdTime: DateTime.now(),
          origin: ChatOrigem.assistent,
          content: e.response!.data['error']['type'] == 'insufficient_quota'
              ? 'Quota atingida, tente novamente mais tarde'
              : 'Erro ao processar sua pergunta',
        ),
      );
    } catch (e) {
      ref.read(chatLoadingProvider.notifier).change(false);
      addBubble(
        ChatEntry(
            createdTime: DateTime.now(),
            origin: ChatOrigem.assistent,
            content: 'Erro ao processar sua pergunta'),
      );
    }
  }
}

@riverpod
class ChatLoading extends _$ChatLoading {
  @override
  bool build() => false;

  change(bool newValue) => state = newValue;
}
