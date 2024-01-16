import 'package:contact_app/add_contact.dart';
import 'package:contact_app/contact_box.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  List listes = [
    ["1 Contact", false],
    ["2 Contact", false],
    ["3 Contact", true]
  ];
  final controller = TextEditingController();

  void change(bool? value, int index) {
    setState(() {
      listes[index][1] = value;
    });
  }

  void saveContact() {
    setState(() {
      listes.add([controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
    });
  }

  void addContact() {
    showDialog(
        context: context,
        builder: (context) {
          return AddContact(
              controller: controller,
              onAdd: saveContact,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void delContact(index) {
    setState(() {
      listes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Contacts"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addContact(),
        child: Icon(Icons.person),
      ),
      body: ListView.builder(
          itemCount: listes.length,
          itemBuilder: (context, index) {
            return ContactBox(
              nomContact: listes[index][0],
              selContact: listes[index][1],
              onChanged: (value) => change(value, index),
              delContact: (context) => delContact(index),
            );
          }),
    );
  }
}
