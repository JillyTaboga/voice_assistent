import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_sources_injection.dart';
import '../domain/entities/chat_entry.dart';
import 'controllers/chat_controller.dart';
import 'controllers/speech_to_text_controller.dart';

class SpeechReadScreen extends ConsumerWidget {
  const SpeechReadScreen({super.key});

  onStartRecording(WidgetRef ref) async {
    ref.read(textToSpeech).stop();
    ref.read(speechToText).startListen(
      ref.read(textReadedProviderProvider.notifier).setText,
      () {
        onStopRecording(ref);
      },
    );
    ref.read(isRecordingProvider.notifier).change();
  }

  onStopRecording(WidgetRef ref) async {
    ref.read(isRecordingProvider.notifier).change();
    ref.read(speechToText).stop();
    ref.read(chatListProvider.notifier).addBubble(
          ChatEntry(
            createdTime: DateTime.now(),
            origin: ChatOrigem.user,
            content: ref.read(textReadedProviderProvider),
          ),
        );
    ref.read(textReadedProviderProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatList = ref.watch(chatListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGpt de voz'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    child: ref.watch(chatLoadingProvider)
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : Container(),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.all(8)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      final chatEntry = chatList[index];
                      final isUser = chatEntry.origin == ChatOrigem.user;
                      final color = isUser ? Colors.green : Colors.blue;
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 10,
                            right: isUser ? 50 : 0,
                            left: isUser ? 0 : 50),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.2),
                          border: Border.all(width: 1, color: color),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          chatEntry.content,
                          textAlign: isUser ? TextAlign.left : TextAlign.right,
                        ),
                      );
                    },
                    childCount: chatList.length,
                  ),
                ),
              ],
            ),
            if (ref.watch(textReadedProviderProvider).isNotEmpty)
              Positioned(
                bottom: 90,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    ref.watch(textReadedProviderProvider),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ref.watch(isSpeechAvaibleProvider).when(
            data: (data) => FloatingActionButton(
              onPressed: data
                  ? ref.watch(isRecordingProvider)
                      ? () {
                          onStopRecording(ref);
                        }
                      : () {
                          onStartRecording(ref);
                        }
                  : null,
              child: data
                  ? ref.watch(isRecordingProvider)
                      ? const Icon(Icons.stop)
                      : const Icon(Icons.mic)
                  : const Icon(Icons.cancel),
            ),
            error: (e, s) => null,
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}
