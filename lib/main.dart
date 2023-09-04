import 'package:flutter/material.dart';

import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    const Quote(text: 'The concert was absolutely amazing', author: 'Stephen King'),
    const Quote(
        author: 'Nora Sheldon',
        text: 'The mountains are covered in snow during the winter months'),
    const Quote(
        author: 'Ngugi wa Thiong\'i',
        text: 'He always makes me laugh with his jokes'),
    const Quote(
        author: 'John Kiriamiti',
        text: 'Learning a new language can be challenging, but it\'s rewarding')
  ];

  void deleteQuote(Quote quote) {
    setState(() {
      quotes.remove(quote);
    });
  }

  Widget quoteTemplate(quote) {
    return QuoteCard(
      quote: quote,
      delete: () => deleteQuote(quote),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'QuoteList',
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: quotes.map((quote) => quoteTemplate(quote)).toList(),
      ),
    );
  }
}
