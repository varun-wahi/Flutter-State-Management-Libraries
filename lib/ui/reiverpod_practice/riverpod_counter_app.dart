import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_mgmt_tut_app/ui/reiverpod_practice/manager/riverpod_provider.dart';

class RiverpodCounterApp extends ConsumerWidget {
  const RiverpodCounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boring Counter Application'),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "1",
            child: const Icon(Icons.add),
            onPressed: () {

              ref.read(counterProvider.notifier).state++;
            },
          ),

          SizedBox(width: 20.0,),

          FloatingActionButton(
            heroTag: "2",
            child: const Icon(Icons.remove),
            onPressed: () {},
          ),

          SizedBox(width: 20.0,),

          FloatingActionButton(
            heroTag: "3",
            child: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body:  Center(
        child: Text(
          'Counter : $count',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
