import 'package:flutter/material.dart';
import 'add_edit_process_screen.dart';

class ProcessesScreen extends StatefulWidget {
  @override
  _ProcessesScreenState createState() => _ProcessesScreenState();
}

class _ProcessesScreenState extends State<ProcessesScreen> {
  List<Map<String, dynamic>> processes = [
    {'name': 'Cutting', 'desc': 'Cutting raw materials'},
    {'name': 'Assembly', 'desc': 'Assembling components'},
  ];

  void _addOrEditProcess([Map<String, dynamic>? process, int? index]) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddEditProcessScreen(process: process),
      ),
    );
    if (result != null) {
      setState(() {
        if (index != null) {
          processes[index] = result;
        } else {
          processes.add(result);
        }
      });
    }
  }

  void _deleteProcess(int index) {
    setState(() {
      processes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Processes')),
      body: ListView.builder(
        itemCount: processes.length,
        itemBuilder: (context, index) {
          final process = processes[index];
          return ListTile(
            title: Text(process['name']),
            subtitle: Text(process['desc']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _addOrEditProcess(process, index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteProcess(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditProcess(),
        child: Icon(Icons.add),
        tooltip: 'Add Process',
      ),
    );
  }
}