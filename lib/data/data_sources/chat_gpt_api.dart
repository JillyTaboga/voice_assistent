import 'package:dio/dio.dart';

import '../../domain/entities/chat_entry.dart';
import 'chat_api.dart';

class ChatGptApi implements ChatApi {
  final _client = Dio();

  @override
  Future<String> getResponse(List<ChatEntry> entries) async {
    final response = await _client.post(
      'https://api.openai.com/v1/chat/completions',
      data: {
        'model': 'gpt-3.5-turbo',
        'messages': entries
            .map((e) => {
                  'role': e.origin == ChatOrigem.user ? 'user' : 'assistant',
                  'content': e.content,
                })
            .toList(),
      },
      options: Options(
        headers: {
          'Authorization':
              'Bearer ${const String.fromEnvironment('OpenAiKey')}',
        },
      ),
    );
    return (response.data['choices'] as List).last['message']['content'];
  }
}
