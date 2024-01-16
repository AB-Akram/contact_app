import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  final controller;
  VoidCallback onAdd;
  VoidCallback onCancel;

  AddContact(
      {super.key,
      required this.controller,
      required this.onAdd,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add user"),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(children: [
          TextField(controller: controller),
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
