import 'package:flutter/material.dart';
import 'add_edit_material_screen.dart';

class MaterialsScreen extends StatefulWidget {
  @override
  _MaterialsScreenState createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  List<Map<String, dynamic>> materials = [
    {'name': 'Steel', 'cost': 100, 'stock': 50},
    {'name': 'Plastic', 'cost': 50, 'stock': 100},
  ];

  void _addOrEditMaterial([Map<String, dynamic>? material, int? index]) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddEditMaterialScreen(material: material),
      ),
    );
    if (result != null) {
      setState(() {
        if (index != null) {
          materials[index] = result;
        } else {
          materials.add(result);
        }
      });
    }
  }

  void _deleteMaterial(int index) {
    setState(() {
      materials.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Materials')),
      body: ListView.builder(
        itemCount: materials.length,
        itemBuilder: (context, index) {
          final material = materials[index];
          return ListTile(
            title: Text(material['name']),
            subtitle: Text('Cost: ${material['cost']} | Stock: ${material['stock']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _addOrEditMaterial(material, index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteMaterial(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditMaterial(),
        child: Icon(Icons.add),
        tooltip: 'Add Material',
      ),
    );
  }
}