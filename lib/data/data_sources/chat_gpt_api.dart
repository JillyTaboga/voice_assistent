import 'package:dio/dio.dart';

import 'chat_api.dart';

class ChatGptApi implements ChatApi {
  final _client = Dio();

  @override
  Future<String> getResponse(String question) async {
    final response = await _client.post(
      'https://api.openai.com/v1/chat/completions',
      data: {
        'model': 'gpt-3.5-turbo',
        'messages': [
          {
            'role': 'user',
            'content': question,
          },
        ],
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
