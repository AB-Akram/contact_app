import 'package:contact_app/contacts_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactsList(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
