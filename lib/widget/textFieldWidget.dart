import 'package:flutter/material.dart';

class Textfieldwidget extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  Textfieldwidget({super.key, required this.controller, required this.name});

  @override
  State<Textfieldwidget> createState() => _TextfieldwidgetState();
}

class _TextfieldwidgetState extends State<Textfieldwidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(color: Colors.black),
        controller: widget.controller,
        obscureText: false,
        decoration:  InputDecoration(
          border: UnderlineInputBorder(),
          labelText: "${widget.name}",
          labelStyle: TextStyle(
            color: Color(0xFF24786D),
            fontSize: 14,
            fontFamily: 'Circular Std',
            fontWeight: FontWeight.w500,
            height: 0.07,
            letterSpacing: 0.10,
          ),
        ));
  }
}
