import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactBox extends StatelessWidget {
  String nameContact;
  bool selContact;
  Function(bool?)? onChanged;
  Function(BuildContext context)? delContact;
  Function(BuildContext context)? onClick;

  ContactBox({
    super.key,
    required String this.nameContact,
    required bool this.selContact,
    required this.onChanged,
    required this.delContact,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: delContact,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            onClick!(context);
          },
          child: Container(
            child: Row(
              children: [
                Checkbox(value: selContact, onChanged: onChanged),
                Text(nameContact),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
