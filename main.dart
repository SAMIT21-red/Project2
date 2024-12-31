import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Scroll to Top Button')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ScrollToTopExample(),
        ),
      ),
    );
  }
}

class ScrollToTopExample extends StatefulWidget {
  @override
  _ScrollToTopExampleState createState() => _ScrollToTopExampleState();
}

class _ScrollToTopExampleState extends State<ScrollToTopExample> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(title: Text('Item $index'));
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: _scrollToTop,
            child: Icon(Icons.arrow_upward),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
