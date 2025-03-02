
import 'package:anime_quote_app/viewmodels/quote_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../viewmodels/quote_viewmodel.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<QuoteViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quote History',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo, // AppBar background color
        elevation: 10, // Add shadow to the AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo.shade100, Colors.purple.shade100], // Background gradient
          ),
        ),
        child: viewModel.quoteHistory.isEmpty
            ? Center(
                child: Text(
                  'No quotes in history yet.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(16), // Add padding around the list
                itemCount: viewModel.quoteHistory.length,
                itemBuilder: (context, index) {
                  final quote = viewModel.quoteHistory[index];
                  return Card(
                    elevation: 5, // Add shadow to the card
                    margin: EdgeInsets.symmetric(vertical: 8), // Add margin between cards
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16), // Add padding inside the ListTile
                      title: Text(
                        quote.content,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.indigo.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        '- ${quote.character} (${quote.anime})',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.indigo.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}