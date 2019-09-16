import 'package:counter_bloc/src/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create and instantiate the bloc
  CounterBloc bloc = CounterBloc(initialCount: 0);

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App with Bloc'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: bloc.counterObservable,
        builder: (context, snapshot) {
          return Center(
            child: Text(
              'ValueAt: ${bloc.initialCount}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: bloc.decrement,
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: bloc.increment,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
