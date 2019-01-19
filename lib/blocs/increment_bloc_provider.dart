import 'package:flutter/material.dart';
import 'increment_bloc.dart';
export 'increment_bloc.dart';

class IncrementBlocProvider extends InheritedWidget {

  final IncrementBloc bloc;

  IncrementBlocProvider({Key key, Widget child})
      :bloc = IncrementBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }


  static IncrementBloc of (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(IncrementBlocProvider) as IncrementBlocProvider).bloc;
  }
}