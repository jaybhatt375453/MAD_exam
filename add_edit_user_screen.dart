import 'package:flutter/material.dart';

class AddEditUserScreen extends StatefulWidget {
  final Map<String, dynamic>? user;
  const AddEditUserScreen({Key? key, this.user}) : super(key: key);

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  String role = 'operator';

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.user?['name'] ?? '');
    emailCtrl = TextEditingController(text: widget.user?['email'] ?? '');
    role = widget.user?['role'] ?? 'operator';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Add User' : 'Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (v) => v == null || v.isEmpty ? 'Enter email' : null,
              ),
              DropdownButtonFormField<String>(
                value: role,
                items: [
                  DropdownMenuItem(value: 'admin', child: Text('Admin')),
                  DropdownMenuItem(value: 'operator', child: Text('Operator')),
                ],
                onChanged: (v) => setState(() => role = v ?? 'operator'),
                decoration: InputDecoration(labelText: 'Role'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'name': nameCtrl.text,
                      'email': emailCtrl.text,
                      'role': role,
                    });
                  }
                },
                child: Text(widget.user == null ? 'Add' : 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}