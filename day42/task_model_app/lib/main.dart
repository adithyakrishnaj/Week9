import 'package:flutter/material.dart';
import 'models/task_model.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Model App',
      theme: ThemeData.dark(),
      home: const TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  late Future<List<TaskModel>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = ApiService.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Task Model Integration"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),

      body: FutureBuilder<List<TaskModel>>(

        future: tasks,

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {

            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final taskList = snapshot.data!;

          return ListView.builder(

            itemCount: taskList.length,

            itemBuilder: (context, index) {

              final task = taskList[index];

              return Card(

                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                child: ListTile(

                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(
                      task.id.toString(),
                    ),
                  ),

                  title: Text(
                    task.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  trailing: Icon(
                    task.completed
                        ? Icons.check_circle
                        : Icons.pending,
                    color: task.completed
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}