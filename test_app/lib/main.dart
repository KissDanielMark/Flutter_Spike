import 'dart:ffi';

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool _bigger = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          /*AnimatedContainer(
            width: _bigger ? 100 : 500,
            child: Image.asset('assets/baby_yoda.png'),
            duration: Duration(seconds: 1),
          ),*/
          TextButton(onPressed: () => setState(() {
              _bigger = !_bigger;
          }), child: /*Text(_bigger ? "Növölj" : "Csökkenj")*/
          //https://medium.com/flutter/flutter-animation-basics-with-implicit-animations-95db481c5916
          //https://api.flutter.dev/flutter/animation/Curves-class.html
          AnimatedContainer(
            width: _bigger ? 100 : 500,
            child: Image.asset('assets/baby_yoda.png'),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubicEmphasized,
            decoration: BoxDecoration(gradient: RadialGradient(colors: const [Colors.purple, Colors.transparent], stops: [_bigger ? 1.2 : -0.5, 1.0])),
          )
          )
        ],)
    );

      Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
