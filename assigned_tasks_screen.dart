import 'package:flutter/material.dart';

class AssignedTasksScreen extends StatelessWidget {
  // Dummy data for assigned tasks
  final List<Map<String, String>> tasks = [
    {
      'title': 'Check Inventory',
      'description': 'Verify stock levels for Material A.',
      'due': 'Due: Today'
    },
    {
      'title': 'Log Material Usage',
      'description': 'Record usage of Material B for Process X.',
      'due': 'Due: Tomorrow'
    },
    {
      'title': 'Scan New Batch',
      'description': 'Scan and register new batch of Material C.',
      'due': 'Due: Next Week'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assigned Tasks')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.assignment),
              title: Text(task['title'] ?? ''),
              subtitle: Text('${task['description']}\n${task['due']}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}