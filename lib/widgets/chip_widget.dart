import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String chipLabel;

  ChipWidget({super.key, required this.chipLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(child: Chip(label: Text(chipLabel), avatar: const Icon(Icons.phone_android))),
    );
  }
}
