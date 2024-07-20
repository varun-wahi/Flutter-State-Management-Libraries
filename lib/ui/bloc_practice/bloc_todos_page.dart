import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mgmt_tut_app/ui/bloc_practice/manager/network_bloc/network_bloc.dart';
import 'package:state_mgmt_tut_app/ui/bloc_practice/manager/network_bloc/network_events.dart';
import 'package:state_mgmt_tut_app/ui/bloc_practice/manager/network_bloc/network_states.dart';

class BlocTodosPage extends StatelessWidget {
  const BlocTodosPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => NetworkBloc()..add(GetTodosEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Todos'),
          centerTitle: true,
        ),
        body: BlocBuilder<NetworkBloc, NetworkStates>(builder: (context, state){
      
          if(state is NetworkFailureState){
            return Center(child: Text("something wrong with request"),);
          }
      
          if(state is NetworkLoadingState){
            return Center(child: CircularProgressIndicator(),);
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
                              todoItem['title'], style: todoItem['completed'] ? TextStyle(color: Colors.white, fontSize: 18.0) : TextStyle(color: Colors.black, fontSize: 18.0) ,
                            ),
                          ),
                        ),
                      );
                    });
          }
      
      
          return Center(child: CircularProgressIndicator(),);
      
      
      
      
      
      
        })
      ),
    );
  }
}
