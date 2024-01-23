import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  final controllerLastName;
  final controllerFirstName;
  final controllerAge;
  final controllerEmail;
  final controllerPicture;
  VoidCallback onAdd;
  VoidCallback onCancel;

  AddContact({
    super.key,
    required this.controllerLastName,
    required this.controllerFirstName,
    required this.controllerAge,
    required this.controllerEmail,
    required this.controllerPicture,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add user"),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(children: [
          TextField(
            controller: controllerLastName,
            decoration: InputDecoration(hintText: 'Enter your last name'),
          ),
          TextField(
            controller: controllerFirstName,
            decoration: InputDecoration(hintText: 'Enter your first name'),
          ),
          TextField(
            controller: controllerAge,
            decoration: InputDecoration(hintText: 'Enter your age'),
          ),
          TextField(
            controller: controllerEmail,
            decoration: InputDecoration(hintText: 'Enter your email'),
          ),
          TextField(
            controller: controllerPicture,
            decoration: InputDecoration(hintText: 'Enter your path of image'),
          ),
          Row(
            children: [
              MaterialButton(onPressed: onAdd, child: Text("Add")),
              MaterialButton(onPressed: onCancel, child: Text("Cancel")),
            ],
          ),
        ]),
      ),
    );
  }
}
