import 'package:flutter/material.dart';
import 'package:provider_example/view/counterScreen.dart';
import 'package:provider_example/view/screenTwo.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
          '/': (context) => CounterScreen(),
          '/screenTwo': (context) => ScreenTwo()
        },
        initialRoute: '/',
    );
  }

}