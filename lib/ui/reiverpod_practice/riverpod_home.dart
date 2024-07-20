import 'package:flutter/material.dart';
import 'package:state_mgmt_tut_app/ui/reiverpod_practice/riverpod_counter_app.dart';

class RiverPodHome extends StatelessWidget {
  const RiverPodHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod counter app")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const RiverpodCounterApp()));
                },
                child: const Text(
                  "Riverpod Boring counter app",
                  style: TextStyle(fontSize: 20.0),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Riverpod API call",
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}
