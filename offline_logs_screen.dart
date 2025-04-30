import 'package:flutter/material.dart';

class OfflineLogsScreen extends StatelessWidget {
  // Dummy data for offline logs
  final List<Map<String, String>> offlineLogs = [
    {
      'material': 'Aluminum',
      'quantity': '3',
      'date': '2024-06-04',
      'status': 'Pending Sync'
    },
    {
      'material': 'Rubber',
      'quantity': '7',
      'date': '2024-06-05',
      'status': 'Pending Sync'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offline Logs')),
      body: ListView.builder(
        itemCount: offlineLogs.length,
        itemBuilder: (context, index) {
          final log = offlineLogs[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.cloud_off),
              title: Text('${log['material']} - ${log['quantity']} units'),
              subtitle: Text('Date: ${log['date']}\nStatus: ${log['status']}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}