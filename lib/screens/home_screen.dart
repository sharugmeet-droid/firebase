import 'package:flutter/material.dart';
import '../services/task_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = TaskService();

    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: StreamBuilder(
        stream: service.getTasks(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return ListTile(title: Text(doc['title']));
            }).toList(),
          );
        },
      ),
    );
  }
}
