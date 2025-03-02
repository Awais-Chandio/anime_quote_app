import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime_quote.dart';

class QuoteRepository {
  Future<AnimeQuote> fetchRandomQuote() async {
    final response = await http.get(Uri.parse('https://animechan.io/api/v1/quotes/random'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return AnimeQuote.fromJson(jsonData);
    } else {
      throw Exception('Failed to load quote. Status code: ${response.statusCode}');
    }
  }
}