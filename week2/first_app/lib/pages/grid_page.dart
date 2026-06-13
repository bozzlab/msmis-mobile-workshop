import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(101, (index) {
          return InkWell(
            onTap: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text('You tapped on item ${index + 1}')),
              // );
              Navigator.pushNamed(context, '/${index + 1}');
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.green[(index % 9 + 1) * 100],
                borderRadius: BorderRadius.circular(10.0),
              ),
              // child: Center(child: Text('${index + 1}', style: const TextStyle(color: Colors.black, fontSize: 10))),
              child: Column(
                children: [Icon(Icons.abc), Text('Item ${index + 1}')],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          );
        }),
      ),
    );
  }
}
