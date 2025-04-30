import 'package:flutter/material.dart';

class AddEditProcessScreen extends StatefulWidget {
  final Map<String, dynamic>? process;
  const AddEditProcessScreen({Key? key, this.process}) : super(key: key);

  @override
  State<AddEditProcessScreen> createState() => _AddEditProcessScreenState();
}

class _AddEditProcessScreenState extends State<AddEditProcessScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl;
  late TextEditingController descCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.process?['name'] ?? '');
    descCtrl = TextEditingController(text: widget.process?['desc'] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.process == null ? 'Add Process' : 'Edit Process'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: 'Process Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: descCtrl,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (v) => v == null || v.isEmpty ? 'Enter description' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'name': nameCtrl.text,
                      'desc': descCtrl.text,
                    });
                  }
                },
                child: Text(widget.process == null ? 'Add' : 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}