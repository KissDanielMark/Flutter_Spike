import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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

  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: targetValue),
              duration: const Duration(seconds: 1),
              builder: (BuildContext context, double size, Widget? child) {
                return Positioned(top: targetValue, bottom: 0, left: 0, right: 0, child: IconButton(
                  iconSize: size,
                  color: Colors.blue,
                  icon: child!,
                  onPressed: () {
                    setState(() {
                      targetValue = targetValue == 24.0 ? 48.0 : 24.0;
                    });
                  },
                )
                );
              },
              child: const Icon(Icons.aspect_ratio),
            )
      )
    );
  }
}
