// import 'package:anime_quote_app/viewmodels/quote_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// //import '../viewmodels/quote_viewmodel.dart';

// class QuoteScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Random Anime Quote'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.history),
//             onPressed: () {
//               Navigator.pushNamed(context, '/history'); // Navigate to HistoryScreen
//             },
//           ),
//         ],
//       ),
//       body: Consumer<QuoteViewModel>(
//         builder: (context, viewModel, child) {
//           if (viewModel.isLoading) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (viewModel.error != null) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.error, color: Colors.red, size: 50),
//                   SizedBox(height: 10),
//                   Text(viewModel.error!),
//                 ],
//               ),
//             );
//           }

//           return Column(
//             children: [
//               Expanded(
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         viewModel.currentQuote?.content ?? 'No quote available',
//                         style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         '- ${viewModel.currentQuote?.character ?? 'Unknown'} (${viewModel.currentQuote?.anime ?? 'Unknown'})',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Provider.of<QuoteViewModel>(context, listen: false).fetchRandomQuote();
//         },
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }

import 'package:anime_quote_app/viewmodels/quote_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../viewmodels/quote_viewmodel.dart';

class QuoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Random Anime Quote',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo, // AppBar background color
        elevation: 10, // Add shadow to the AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.history, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/history'); // Navigate to HistoryScreen
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo.shade100, Colors.purple.shade100], // Background gradient
          ),
        ),
        child: Consumer<QuoteViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo), // Loading spinner color
                ),
              );
            }

            if (viewModel.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 50),
                    SizedBox(height: 10),
                    Text(
                      viewModel.error!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Card(
                          elevation: 10, // Add shadow to the card
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Rounded corners
                          ),
                          color: Colors.white, // Card background color
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  viewModel.currentQuote?.content ?? 'No quote available',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.indigo.shade800,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  '- ${viewModel.currentQuote?.character ?? 'Unknown'} (${viewModel.currentQuote?.anime ?? 'Unknown'})',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<QuoteViewModel>(context, listen: false).fetchRandomQuote();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.indigo, // Button background color
                                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // Rounded button
                                    ),
                                    elevation: 5, // Button shadow
                                  ),
                                  child: Text(
                                    'Tap for New Random Quote',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}