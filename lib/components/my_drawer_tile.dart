import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? ontap;
  const MyDrawerTile(
      {super.key, required this.icon, required this.ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          leading: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
