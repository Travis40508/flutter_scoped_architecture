import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class IncrementBloc {

  final _incrementSubject = BehaviorSubject<int>();

  Observable<int> get incrementStream => _incrementSubject.stream;

  void dispose() {
    _incrementSubject.drain();
    _incrementSubject.close();
  }

  void onButtonPressed() {
    if (_incrementSubject.value == null) {
      _incrementSubject.sink.add(0);
    }

    _incrementSubject.sink.add(_incrementSubject.value + 1);
    print(_incrementSubject.value);
  }
}