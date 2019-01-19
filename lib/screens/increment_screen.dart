import 'package:flutter/material.dart';
import 'package:architecture/blocs/increment_bloc_provider.dart';

class IncrementScreen extends StatefulWidget {
  @override
  _IncrementScreenState createState() => _IncrementScreenState();
}

class _IncrementScreenState extends State<IncrementScreen> {

  IncrementBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = IncrementBlocProvider.of(context);
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
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      title: Text(
        'Increment Number',
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }

  Widget buildBody() {
    return Center(
      child: StreamBuilder(
        stream: bloc.incrementStream,
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          return Text(
            '${snapshot.data}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          );
        },
      )
    );
  }

  Widget buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      onPressed: () => bloc.onButtonPressed(),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
