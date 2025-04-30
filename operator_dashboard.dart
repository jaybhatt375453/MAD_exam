import 'package:flutter/material.dart';
import 'scan_screen.dart';
import 'consumption_log_screen.dart';
import 'assigned_tasks_screen.dart';
import 'offline_logs_screen.dart';

class OperatorDashboard extends StatelessWidget {
  const OperatorDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Operator Dashboard')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.qr_code_scanner),
            title: const Text('Scan Material'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ScanScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Consumption Log'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ConsumptionLogScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Assigned Tasks'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AssignedTasksScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.cloud_off),
            title: const Text('Offline Logs'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => OfflineLogsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}