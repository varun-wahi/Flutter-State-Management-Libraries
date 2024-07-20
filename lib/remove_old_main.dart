import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_mgmt_tut_app/ui/bloc_practice/manager/counter/counter_bloc.dart';
import 'package:state_mgmt_tut_app/ui/home_page.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
      
                ),
                backgroundColor: Colors.black.withOpacity(0.7),
                foregroundColor: Colors.white
              )
            ),
      
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.black.withOpacity(0.7),
                foregroundColor: Colors.white
            )
            
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage()),
    );
  }
}
