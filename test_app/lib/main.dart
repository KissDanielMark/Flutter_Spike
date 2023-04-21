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

  double targetValue = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(seconds: 10),
              builder: (BuildContext context, double size, Widget? child) {
                return Opacity(
                  opacity: size,
                  child: Padding(padding:EdgeInsets.only(top: size*200), child: child,/*child: IconButton(
                  iconSize: size,
                  color: Colors.blue,
                  icon: child!, onPressed: () {  },
                  /*onPressed: () {
                    setState(() {
                      targetValue = targetValue == 24.0 ? 48.0 : 24.0;
                    });
                  },*/
                ),*/)
                );
              },
              child: const Icon(Icons.aspect_ratio),

            )
      )
    );
  }
}
