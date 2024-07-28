import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/controller/counterController.dart';
import 'package:provider_example/view/screenTwo.dart';

class CounterScreen extends StatefulWidget {
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {

  @override
  void initState() {
    // TODO: implement initState

    Provider.of<CounterController>(context, listen: false).increment();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterController>(context, listen: false);

    log('Screen Rebuilt');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(counter.counterValue.toString()),
            ElevatedButton(
                onPressed: () {
                  counter.increment();
                  counter.logOutput();
                },
                child: const Text('Increment')),
            ElevatedButton(
                onPressed: () {
                  counter.decrement();
                  counter.logOutput();
                },
                child: const Text('Decrement')),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenTwo())),
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
