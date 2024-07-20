import 'package:flutter/material.dart';
import 'package:state_mgmt_tut_app/ui/cubit_practice/cubit_counter_page.dart';
import 'package:state_mgmt_tut_app/ui/cubit_practice/cubit_todos_page.dart';

class CubitHomePage extends StatelessWidget {
  const CubitHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit State Management'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Cubit Counter App',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CubitCounterPage()));
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child:
                  const Text('Cubit Api Call', style: TextStyle(fontSize: 18.0)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CubitTodosPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
