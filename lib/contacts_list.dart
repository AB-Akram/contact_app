import 'package:contact_app/add_contact.dart';
import 'package:contact_app/contact_box.dart';
import 'package:contact_app/models/Contact.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  List contactListes = [
    [
      Contact('LastNameContacte1', 'firstNameContacte1', '21',
          'contact1@contact1.com', 'pathPicture'),
      false
    ],
    [
      Contact('LastNameContacte2', 'firstNameContacte2', '22',
          'contact2@contact2.com', 'pathPicture'),
      false
    ],
    [
      Contact('LastNameContacte3', 'firstNameContacte3', '23',
          'contact3@contact3.com', 'pathPicture'),
      false
    ],
  ];

  final controllerLastName = TextEditingController();
  final controllerFirstName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPicture = TextEditingController();

  void change(bool? value, int index) {
    setState(() {
      contactListes[index][1] = value;
    });
  }

  void saveContact() {
    setState(() {
      contactListes.add([
        Contact(
            controllerLastName.text.trim(),
            controllerFirstName.text.trim(),
            controllerAge.text.trim(),
            controllerEmail.text.trim(),
            controllerPicture.text.trim()),
        false
      ]);
      controllerLastName.clear();
      controllerFirstName.clear();
      controllerAge.clear();
      controllerEmail.clear();
      controllerPicture.clear();
      Navigator.of(context).pop();
    });
  }

  void addContact() {
    showDialog(
        context: context,
        builder: (context) {
          return AddContact(
              controllerLastName: controllerLastName,
              controllerFirstName: controllerFirstName,
              controllerAge: controllerAge,
              controllerEmail: controllerEmail,
              controllerPicture: controllerPicture,
              onAdd: saveContact,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void delContact(index) {
    setState(() {
      if (contactListes[index][1]) {
        contactListes.removeAt(index);
      }
    });
  }

  void clickContact(index) {
    print("the Last Name is : " + contactListes[index][0].lastName.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Contacts"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addContact(),
        child: Icon(Icons.person),
      ),
      body: ListView.builder(
          itemCount: contactListes.length,
          itemBuilder: (context, index) {
            return ContactBox(
              nameContact: (contactListes[index][0].lastName.toString() +" " + contactListes[index][0].firstName.toString()),
              selContact: contactListes[index][1],
              onChanged: (value) => change(value, index),
              delContact: (context) => delContact(index),
              onClick: (context) => clickContact(index),
            );
          }),
    );
  }
}
