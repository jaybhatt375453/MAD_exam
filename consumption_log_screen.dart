import 'package:flutter/material.dart';

class ConsumptionLogScreen extends StatelessWidget {
  // Dummy data for consumption logs
  final List<Map<String, String>> logs = [
    {
      'material': 'Steel',
      'quantity': '10',
      'date': '2024-06-01',
      'process': 'Cutting'
    },
    {
      'material': 'Plastic',
      'quantity': '5',
      'date': '2024-06-02',
      'process': 'Molding'
    },
    {
      'material': 'Copper',
      'quantity': '2',
      'date': '2024-06-03',
      'process': 'Wiring'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consumption Log')),
      body: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          final log = logs[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.inventory),
              title: Text('${log['material']} - ${log['quantity']} units'),
              subtitle: Text('Process: ${log['process']}\nDate: ${log['date']}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}