import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_mgmt_tut_app/ui/reiverpod_practice/manager/riverpod_provider.dart';

class RiverpodCounterApp extends ConsumerWidget {
  const RiverpodCounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final count = ref.watch(counterProvider);
    ref.listen(counterProvider, (previous, next){
      if(next < 0){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Negative value not allowed.")));
      }

    });


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
            onPressed: () {
              int counterValue = ref.read(counterProvider.notifier).state;
              if(counterValue > 0 ){
                ref.read(counterProvider.notifier).state--;
              }
              else{
                print("value can't be decreased");
              }
              
            },
          ),

          SizedBox(width: 20.0,),

          FloatingActionButton(
            heroTag: "3",
            child: const Icon(Icons.refresh),
            onPressed: () {
              ref.refresh(counterProvider);
            },
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
