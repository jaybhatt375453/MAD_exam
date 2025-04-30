import 'package:flutter/material.dart';
import 'materials_screen.dart';
import 'processes_screen.dart';
import 'users_screen.dart';
import 'analytics_screen.dart';
import 'reports_screen.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Materials'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialsScreen())),
          ),
          ListTile(
            title: Text('Processes'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProcessesScreen())),
          ),
          ListTile(
            title: Text('Users'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UsersScreen())),
          ),
          ListTile(
            title: Text('Analytics'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AnalyticsScreen())),
          ),
          ListTile(
            title: Text('Reports'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsScreen())),
          ),
        ],
      ),
    );
  }
}