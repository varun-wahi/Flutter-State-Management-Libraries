// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mgmt_tut_app/ui/bloc_practice/manager/counter/counter_bloc.dart';

class BlocCounterApp extends StatelessWidget {
  const BlocCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "1",
            child: const Icon(Icons.add),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            },
          ),
          const SizedBox(
            width: 20.0,
          ),
          FloatingActionButton(
            heroTag: "2",
            child: const Icon(Icons.remove),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
            },
          ),
          const SizedBox(
            width: 20.0,
          ),
          FloatingActionButton(
            heroTag: "3",
            child: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(RefreshEvent());
            },
          ),
        ],
      ),
      body: BlocConsumer<CounterBloc, int>(

        listener: (context, state) {
          
          if(state <=-1){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Negative value not allowed.")));
      }
          },
        
        
        builder: (context, state) {
        return Center(
          child: Text(
            "Counter : $state",
            style: TextStyle(fontSize: 25.0),
          ),
        );
      }),
    );
  }
}
