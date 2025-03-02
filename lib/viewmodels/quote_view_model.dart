import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/anime_quote.dart';
import '../repositories/quote_repository.dart';

class QuoteViewModel with ChangeNotifier {
  final QuoteRepository _repository = QuoteRepository();
  AnimeQuote? _currentQuote;
  List<AnimeQuote> _quoteHistory = [];

  AnimeQuote? get currentQuote => _currentQuote;
  List<AnimeQuote> get quoteHistory => _quoteHistory;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  QuoteViewModel() {
    loadQuoteHistory();
  }

  Future<void> fetchRandomQuote() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final quote = await _repository.fetchRandomQuote();
      _currentQuote = quote;
      _updateQuoteHistory(quote);
      await saveQuoteHistory();
    } catch (e) {
      _error = 'Failed to fetch quote. Please try again.';
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _updateQuoteHistory(AnimeQuote quote) {
    _quoteHistory.insert(0, quote);
    if (_quoteHistory.length > 10) {
      _quoteHistory.removeLast();
    }
  }

  Future<void> loadQuoteHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = prefs.getStringList('quoteHistory') ?? [];
    _quoteHistory = historyJson.map((json) => AnimeQuote.fromJson(jsonDecode(json))).toList();
    notifyListeners();
  }

  Future<void> saveQuoteHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = _quoteHistory.map((quote) => jsonEncode(quote.toJson())).toList();
    prefs.setStringList('quoteHistory', historyJson);
  }
}