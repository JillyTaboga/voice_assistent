import '../../domain/entities/chat_entry.dart';

abstract class ChatApi {
  Future<String> getResponse(List<ChatEntry> entries);
}
