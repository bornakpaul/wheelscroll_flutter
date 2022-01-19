import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String states;
  MyTile({
    Key? key,
    required this.states,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        states,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
