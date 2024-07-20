import 'package:flutter/material.dart';
import 'package:state_mgmt_tut_app/ui/bloc_practice/bloc_home.dart';
import 'package:state_mgmt_tut_app/ui/reiverpod_practice/riverpod_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State Management Solutions")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RiverPodHome()));
                },
                child: Text(
                  "Flutter Riverpod",
                  style: TextStyle(fontSize: 20),
                )),
                const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Flutter Cubit",
                  style: TextStyle(fontSize: 20),
                )),
                const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                     Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BlocHome()));
                },
                child: Text(
                  "Flutter Bloc",
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
