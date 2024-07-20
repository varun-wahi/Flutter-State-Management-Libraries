import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mgmt_tut_app/ui/cubit_practice/manager/network_cubit/network_cubit.dart';
import 'package:state_mgmt_tut_app/ui/cubit_practice/manager/network_cubit/network_state.dart';

class CubitTodosPage extends StatelessWidget {
  const CubitTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Todos'),
        centerTitle: true,
      ),
      body: BlocBuilder<NetworkCubit, NetworkState>(
        builder: (context, state) {
          if(state is NetworkFailureState){
            return const Center(child: Text("something wrong with request"),);
          }
      
          if(state is NetworkLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }
      
      
          if(state is NetworkLoadedState){
            final todosData = state.todos;
            return  ListView.builder(
                  
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
                              todoItem['title'], style: todoItem['completed'] ? const TextStyle(color: Colors.white, fontSize: 18.0) : const TextStyle(color: Colors.black, fontSize: 18.0) ,
                            ),
                          ),
                        ),
                      );
                    });
          }
      
      
          return const Center(child: CircularProgressIndicator(),);
      
      
      
      
      
        },
      )
      
    );
  }
}
