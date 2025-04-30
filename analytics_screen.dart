import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final totalMaterials = 5;
    final totalProcesses = 3;
    final totalUsers = 7;
    final totalUsage = 120;

    return Scaffold(
      appBar: AppBar(title: Text('Analytics')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard Analytics',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 24),
            Text('Total Materials: $totalMaterials'),
            Text('Total Processes: $totalProcesses'),
            Text('Total Users: $totalUsers'),
            Text('Total Material Usage: $totalUsage'),
            SizedBox(height: 32),
            Text('Charts (dummy):'),
            SizedBox(height: 16),
            LinearProgressIndicator(value: 0.7, minHeight: 10),
            SizedBox(height: 8),
            LinearProgressIndicator(value: 0.4, minHeight: 10, color: Colors.green),
          ],
        ),
      ),
    );
  }
}