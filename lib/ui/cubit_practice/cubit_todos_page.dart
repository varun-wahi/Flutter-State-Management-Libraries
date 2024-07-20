import 'package:flutter/material.dart';

class CubitTodosPage extends StatelessWidget {
  const CubitTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Todos'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Cubit Todos Page is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
