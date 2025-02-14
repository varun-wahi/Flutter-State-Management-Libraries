import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mgmt_tut_app/repository/network_repository.dart';

import 'package:state_mgmt_tut_app/ui/bloc_practice/manager/network_bloc/network_events.dart';
import 'package:state_mgmt_tut_app/ui/bloc_practice/manager/network_bloc/network_states.dart';

class NetworkBloc extends Bloc<NetworkEvents, NetworkStates>{

  final networkRepository = NetworkRepository();

  NetworkBloc() : super(NetworkInitialState()){
    on<GetTodosEvent>((event, emit) {

      emit(NetworkLoadingState());
      try{

        networkRepository.getTodos().then((todos){
          add(LoadTodosEvent(todos));
        });
        

      }catch(_){
        emit(NetworkFailureState());
      }
    });

    on<LoadTodosEvent>((event, emit) {
      emit(NetworkLoadedState(event.todos));
    });
  }
}