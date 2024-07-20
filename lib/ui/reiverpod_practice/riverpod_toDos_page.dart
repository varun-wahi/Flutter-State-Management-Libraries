import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_mgmt_tut_app/ui/reiverpod_practice/manager/riverpod_provider.dart';

class RiverpodToDosPage extends ConsumerWidget {
  const RiverpodToDosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(getTodosProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text("Riverpod TO DOs"),
        ),
        body: todos.when(
            data: (todosData) {
              return ListView.builder(
                
                  itemCount: todosData.length,
                  itemBuilder: (context, index) {
                    final todoItem = todosData[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 3.0,
                        
                        color: todoItem['completed'] ? Colors.black.withOpacity(0.8) : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            todoItem['title'], style: todoItem['completed'] ? TextStyle(color: Colors.white, fontSize: 18.0) : TextStyle(color: Colors.black, fontSize: 18.0) ,
                          ),
                        ),
                      ),
                    );
                  });
            },
            error: (error, _) => Center(
                  child: Text(error.toString()),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
