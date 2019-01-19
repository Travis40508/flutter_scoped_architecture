import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ChangeTextBloc {

  final _changeTextSubject = new PublishSubject<String>();
  Observable<String> get changeTextStream => _changeTextSubject.stream;

  void dispose() {
    _changeTextSubject.drain();
    _changeTextSubject.close();
  }

  onTextChanged(String loginText) {
    _changeTextSubject.sink.add(loginText);
  }

}