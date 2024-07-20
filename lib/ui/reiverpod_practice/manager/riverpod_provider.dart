import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_mgmt_tut_app/repository/network_repository.dart';
//VALUE REMAINS SAME WHEN WE COME BACK TO PAGE
// final counterProvider = StateProvider<int>((ref) => 0);

//VALUE RESETS TO 0 WHENEVER WE COME BACK TO PAGE
final counterProvider = StateProvider.autoDispose<int>((ref) => 0);

//register network repository
final networkRepositoryProvider = StateProvider<NetworkRepository>((ref)=> NetworkRepository());


//Fetch api data from network repository object/instance provider
final getTodosProvider = FutureProvider<List<dynamic>>((ref){

    return ref.watch(networkRepositoryProvider).getTodos();

});