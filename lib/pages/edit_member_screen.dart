import 'package:flutter/material.dart';
import '../models/membre.dart';


class EditMemberScreen extends StatefulWidget {
  final Member member;
  final Function(Member) editMemberCallback;

  EditMemberScreen({required this.member, required this.editMemberCallback});

  @override
  _EditMemberScreenState createState() => _EditMemberScreenState();
}

class _EditMemberScreenState extends State<EditMemberScreen> {
  late TextEditingController _nameController;
  late TextEditingController _membershipIdController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.member.name);
    _membershipIdController = TextEditingController(text: widget.member.membershipId);
    _descriptionController = TextEditingController(text: widget.member.description);
    _imageUrlController = TextEditingController(text: widget.member.imagePath);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _membershipIdController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _submit() {
    final editedMember = Member(
      name: _nameController.text,
      membershipId: _membershipIdController.text,
      description: _descriptionController.text,
      imagePath: _imageUrlController.text,
    );
    widget.editMemberCallback(editedMember);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier l\'adhérent'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextFormField(
              controller: _membershipIdController,
              decoration: InputDecoration(labelText: 'ID d\'adhérent'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextFormField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'URL de l\'image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
