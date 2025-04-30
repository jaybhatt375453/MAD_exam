import 'package:flutter/material.dart';

class AddEditMaterialScreen extends StatefulWidget {
  final Map<String, dynamic>? material;
  const AddEditMaterialScreen({Key? key, this.material}) : super(key: key);

  @override
  State<AddEditMaterialScreen> createState() => _AddEditMaterialScreenState();
}

class _AddEditMaterialScreenState extends State<AddEditMaterialScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl;
  late TextEditingController costCtrl;
  late TextEditingController stockCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.material?['name'] ?? '');
    costCtrl = TextEditingController(text: widget.material?['cost']?.toString() ?? '');
    stockCtrl = TextEditingController(text: widget.material?['stock']?.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.material == null ? 'Add Material' : 'Edit Material'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: 'Material Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: costCtrl,
                decoration: InputDecoration(labelText: 'Cost'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || v.isEmpty ? 'Enter cost' : null,
              ),
              TextFormField(
                controller: stockCtrl,
                decoration: InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || v.isEmpty ? 'Enter stock' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'name': nameCtrl.text,
                      'cost': int.tryParse(costCtrl.text) ?? 0,
                      'stock': int.tryParse(stockCtrl.text) ?? 0,
                    });
                  }
                },
                child: Text(widget.material == null ? 'Add' : 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}