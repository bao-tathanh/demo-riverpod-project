import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String label;
  final IconData icon;
   ChipWidget({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(child: Row(
      children: [
        Icon(icon),
        Chip(label: Text(label)),
      ],
    ));

  }
}
