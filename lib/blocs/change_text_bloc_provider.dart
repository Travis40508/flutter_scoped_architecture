import 'package:flutter/material.dart';
import 'change_text_bloc.dart';
export 'change_text_bloc.dart';

class ChangeTextBlocProvider extends InheritedWidget {

final ChangeTextBloc bloc;

  ChangeTextBlocProvider({Key key, Widget child})
  :bloc = ChangeTextBloc(),
  super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }


  static ChangeTextBloc of (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ChangeTextBlocProvider) as ChangeTextBlocProvider).bloc;
  }
}