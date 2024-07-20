import 'package:flutter/material.dart';
import 'package:state_mgmt_tut_app/ui/bloc_practice/bloc_todos_page.dart';

import 'bloc_counter_app.dart';

class BlocHome extends StatelessWidget {
  const BlocHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Bloc Counter App',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => BlocCounterApp()));
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child:
                  const Text('Bloc Api Call', style: TextStyle(fontSize: 18.0)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => BlocTodosPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
