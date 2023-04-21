import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

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

  double targetValue = 1;

  double scaleIn(double value) => value * 1.0;

  double angleIn(double value) => value * math.pi;

  @override
  Widget build(BuildContext context) {

    //https://medium.com/@gondaimgano/multiple-animations-using-tweenanimationbuilder-9243dd7d39e6
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          child: Container(
            decoration: BoxDecoration(color: Colors.purple[800]),
            width: 200,
            height: 200,
          ),
          duration: Duration(milliseconds: 100),
          curve: Curves.easeOut,
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.scale(
              scale: scaleIn(value),
              child: Transform.rotate(
                angle: angleIn(value),
                child: child/*Container(
                  decoration: BoxDecoration(color: Colors.purple[800]),
                  width: 200,
                  height: 200,
                ),*/
              ),
            );
          },
        ),
      )
    );
  }
}
