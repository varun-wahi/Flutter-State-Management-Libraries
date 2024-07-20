import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkRepository {
  //initialize http client
  final http.Client client = http.Client();

  //send request to api
  Future<List<dynamic>> getTodos() async {
    try {
      final response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

      if (response.statusCode == 200) {
        List<dynamic> todosList = json.decode(response.body);
        print(todosList);
        return todosList;
      } else {
        return [];
      }
    } catch (_) {
      print("Something wrong with http request.");
      return [];
    }
  }
}
