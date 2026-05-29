import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class ApiService {

  static Future<List<TaskModel>> fetchTasks() async {

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode == 200) {

      List data = jsonDecode(response.body);

      return data.map((task) {
        return TaskModel.fromJson(task);
      }).toList();

    } else {

      throw Exception('Failed to load tasks');

    }
  }
}