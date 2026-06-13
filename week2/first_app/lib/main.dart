import 'package:flutter/material.dart';
import 'package:first_app/pages/grid_page.dart';
import 'package:first_app/pages/list_page.dart';
import 'package:first_app/pages/blank_page.dart';
import 'package:first_app/pages/form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 12, 163, 68),
        ),
      ),
      onUnknownRoute: (settings) {
        debugPrint('Route not found: ${settings.name}');
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Home'),
        );
      },
      initialRoute: '/',
      // home: const MyHomePage(title: 'bozz v1'),
      routes: {
        '/': (context) => const MyHomePage(title: 'Home'),
        '/blank': (context) => const BlankPage(title: 'Blank Page bozz na kub'),
        '/list': (context) => const ListPage(title: 'List Page bozz na kub'),
        '/grid': (context) => const GridPage(title: 'Grid Page bozz na kub'),
        '/1': (context) => const BlankPage(title: 'Blank Page 1 na kub'),
        '/2': (context) => const ListPage(title: 'List Page 2 na kub'),
        '/3': (context) => const GridPage(title: 'Grid Page 3 na kub'),
        '/4': (context) => const FormPage(title: 'Form Page 4 na kub'),
        '/form': (context) => const FormPage(title: 'Form Page bozz na kub'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.home_max),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("let's `rm -rf /` together!"),
                  duration: const Duration(seconds: 5),
                  action: SnackBarAction(
                    label: 'Yes',
                    onPressed: () {
                      debugPrint('Yes action pressed');
                    },
                  ),
                ),
              );
            },
            icon: const Icon(Icons.warning_amber),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/blank');
            },
            icon: const Icon(Icons.block_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
            icon: const Icon(Icons.list_alt_sharp),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/grid');
            },
            icon: const Icon(Icons.grid_3x3_sharp),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/form');
            },
            icon: const Icon(Icons.format_align_center),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceAround,
          crossAxisAlignment: .center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Image.network(
                    'https://avatars.githubusercontent.com/u/229550252?s=400&u=04791f42f3289b90fd9f4b21fdeececa6068512f&v=4',
                    width: 200,
                    // height: 200,
                  ),
                  Icon(
                    Icons.catching_pokemon_sharp,
                    size: 60,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            // Image.asset('assets/images/media_3.jpeg', width: 200, height: 200),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(label: "Click"),
                MyButton(label: "Okay v1"),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter += 5;
                      debugPrint(
                        "Adhoc button pressed, counter increased by 5",
                      );
                    });
                  },
                  child: const Text('Adhoc'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.catching_pokemon_sharp),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(label),
      onPressed: () {
        debugPrint('$label pressed');
      },
    );
  }
}
