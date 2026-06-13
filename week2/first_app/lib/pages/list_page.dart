import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key, required this.title});

  final String title;

  static const List<String> entries = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
  ];
  static const List<int> colorCodes = [600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 500,
            margin: const EdgeInsets.all(10.0),
            color: Colors.green[colorCodes[index % 3]],
            child: Center(
              child: Text('Item ${entries[index]} number ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
