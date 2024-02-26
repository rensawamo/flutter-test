import 'package:counter_app/counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final Counter counter = Counter();

  void _increment() {
    setState(() {
      counter.increment();
    });
  }
  void _decrement() {
    setState(() {
      counter.decrement();
    });
  }
  void _reset() {
    setState(() {
      counter.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ユニットテスト',
            ),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min, // Columnをできるだけコンパクトにする
        children: [
          FloatingActionButton(
            onPressed: () {
              _increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),

          FloatingActionButton(
            onPressed: () {
              // 3つ目のボタンのアクション
            },
            tooltip: 'reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
