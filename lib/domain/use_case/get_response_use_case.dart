import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources_injection.dart';
import '../entities/chat_entry.dart';

part 'get_response_use_case.g.dart';

@riverpod
Future<ChatEntry> getResponseUseCase(
    GetResponseUseCaseRef ref, List<ChatEntry> entries) async {
  final ds = ref.watch(chatApi);
  final response = await ds.getResponse(entries);
  return ChatEntry(
    createdTime: DateTime.now(),
    origin: ChatOrigem.assistent,
    content: response,
  );
}
