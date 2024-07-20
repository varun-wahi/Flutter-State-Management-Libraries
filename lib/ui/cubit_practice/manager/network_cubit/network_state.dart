abstract class NetworkState {}

class NetworkInitialState extends NetworkState {}

class NetworkLoadingState extends NetworkState {}

class NetworkLoadedState extends NetworkState {
  final List<dynamic> todos;

  NetworkLoadedState({required this.todos});
}

class NetworkFailureState extends NetworkState {}
