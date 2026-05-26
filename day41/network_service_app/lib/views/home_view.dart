import 'package:flutter/material.dart';
import '../services/network_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final NetworkService service = NetworkService();

  String message = "Press button to fetch tasks";

  Future<void> fetchData() async {

    setState(() {
      message = "Fetching data...";
    });

    await service.fetchTasks();

    setState(() {
      message = "Tasks fetched successfully!\nCheck console output.";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("HTTP Network Service"),
        centerTitle: true,
      ),

      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.cloud_download,
                size: 100,
                color: Colors.indigo,
              ),

              const SizedBox(height: 30),

              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(

                onPressed: fetchData,

                icon: const Icon(Icons.download),

                label: const Text("Fetch Tasks"),

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 18,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Uses HTTP GET request\nwith placeholder API.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}