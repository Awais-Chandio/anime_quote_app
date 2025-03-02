import 'package:anime_quote_app/viewmodels/quote_view_model.dart';
import 'package:anime_quote_app/views/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'viewmodels/quote_viewmodel.dart';
import 'views/quote_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuoteViewModel()..fetchRandomQuote(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Random Anime Quote',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: QuoteScreen(),
        routes: {
          '/history': (context) => HistoryScreen(),
        },
      ),
    );
  }
}