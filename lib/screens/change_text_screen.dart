import 'package:architecture/screens/increment_screen.dart';
import 'package:flutter/material.dart';
import 'package:architecture/blocs/change_text_bloc_provider.dart';
import 'package:architecture/blocs/increment_bloc_provider.dart';

class ChangeTextScreen extends StatefulWidget {
  @override
  _ChangeTextScreenState createState() => _ChangeTextScreenState();
}

class _ChangeTextScreenState extends State<ChangeTextScreen> {

  ChangeTextBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = ChangeTextBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppBar(),
      body: buildLoginBox(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      title: Text(
        'Change Text',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildLoginBox() {
    return ListView(
      children: <Widget>[
        StreamBuilder(
          stream: bloc.changeTextStream,
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            return Text(
              '${snapshot.data}',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black
              ),
            );
          },
        ),
        TextField(
          onChanged: (s) => bloc.onTextChanged(s),
        ),
      ],
    );
  }

  Widget buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      onPressed: () => _onNextPressed(),
      child: Icon(
        Icons.navigate_next,
        color: Colors.white,
      ),
    );
  }

  _onNextPressed() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => IncrementBlocProvider(
      child: IncrementScreen(),
    )));
  }
}
