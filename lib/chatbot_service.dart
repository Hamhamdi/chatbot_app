import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatbotService {
  final String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  Future<String> getResponse(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${dotenv.env['OPENAI_API_KEY']}',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [{'role': 'user', 'content': message}],
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'].trim();
      } else {
        // Return a user-friendly error message
        return 'The bot can\'t respond right now. Please try again later.';
      }
    } catch (e) {
      print('Error in getResponse: $e');
      return 'The bot can\'t respond right now. Please try again later.';
    }
  }
}
