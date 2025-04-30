import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  void _exportReport(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Report exported as PDF/CSV (dummy)!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reportData = [
      {'Material': 'Steel', 'Used': 30, 'Cost': 3000},
      {'Material': 'Plastic', 'Used': 50, 'Cost': 2500},
      {'Material': 'Copper', 'Used': 10, 'Cost': 1500},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Reports')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cost Breakdown Report',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Material')),
                      DataColumn(label: Text('Used')),
                      DataColumn(label: Text('Cost')),
                    ],
                    rows: reportData.map((row) {
                      return DataRow(cells: [
                        DataCell(Text(row['Material'].toString())),
                        DataCell(Text(row['Used'].toString())),
                        DataCell(Text(row['Cost'].toString())),
                      ]);
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.download),
                label: Text('Export as PDF/CSV'),
                onPressed: () => _exportReport(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}