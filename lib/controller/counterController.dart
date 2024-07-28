import 'dart:developer';

import 'package:flutter/material.dart';

class CounterController with ChangeNotifier {
  int _counter = 0;

  int get counterValue {
    return _counter;
  }

  void increment() {
    _counter++;


    log('Current Value: $_counter');

    notifyListeners();
  }

  void decrement() {
    _counter--;

    notifyListeners();
  }

  void logOutput() {
    log('Counter Value: $_counter');
  }
}