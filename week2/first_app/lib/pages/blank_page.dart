import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(child: Text('This is a blank page')),
    );
  }
}
