import 'package:flutter/material.dart';
import 'screens/change_text_screen.dart';
import 'blocs/change_text_bloc_provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: ChangeTextBlocProvider(
        child: ChangeTextScreen(),
      )
    );
  }
}
