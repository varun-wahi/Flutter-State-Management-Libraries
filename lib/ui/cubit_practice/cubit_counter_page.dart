import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mgmt_tut_app/ui/cubit_practice/manager/counter_cubit.dart';

class CubitCounterPage extends StatelessWidget {
  const CubitCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "1",
              child: const Icon(Icons.add),
              onPressed: () {

                BlocProvider.of<CounterCubit>(context).increment();
              },
            ),
            const SizedBox(
              width: 20.0,
            ),
            FloatingActionButton(
              heroTag: "2",
              child: const Icon(Icons.remove),
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              },
            ),
            const SizedBox(
              width: 20.0,
            ),
            FloatingActionButton(
              heroTag: "3",
              child: const Icon(Icons.refresh),
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).refresh();
              },
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Cubit Counter'),
          centerTitle: true,
        ),
        body: BlocConsumer<CounterCubit, int>(
          builder: (context, state) {
            return Center(
              child: Text(
                "Counter : $state",
                style: TextStyle(fontSize: 30),
              ),
            );
          },
          listener: (context, state) {
            if (state <= -1) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Value can't be negative"),
                ),
              );
            }
          },
        ));
  }
}
