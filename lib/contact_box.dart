import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactBox extends StatelessWidget {
  String nomContact;
  bool selContact;
  Function(bool?)?
      onChanged; // onChanged c'est le nom de la fonction // Function(bool?)? c'est un type de l'attribut onChanged // cette fonction est un callBack
  Function(BuildContext context)? delContact;

  ContactBox(
      {super.key,
      required String this.nomContact,
      required bool this.selContact,
      required this.onChanged,
      required this.delContact});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child : Slidable(
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
          child: Container(
            child: Row(
              children: [
                Checkbox(value: selContact, onChanged: onChanged),
                Text(nomContact),
              ],
            ),
          ),
        ),
        );
  }
}
