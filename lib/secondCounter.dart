import 'package:flutter/material.dart';

class SecondCounter with ChangeNotifier {
  int _counter;

  SecondCounter(this._counter);

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment() {
    _counter = _counter + 5;
    notifyListeners();
  }

  void decrement() {
    _counter = _counter - 5;

    notifyListeners();
  }
}
