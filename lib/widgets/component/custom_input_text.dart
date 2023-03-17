import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CustomInputText extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool visible;


  CustomInputText({Key? key,
    required this.controller,
    required this.hint,
    this.visible = true,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        height: 44,
        margin: EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          maxLines: 1,
          style: TextStyle(
            color: foregroundColor,
          ),
          decoration: InputDecoration(
              filled: true,
              labelText: hint,
              fillColor: backgroundColor,
              border: OutlineInputBorder(borderSide: BorderSide(color: backgroundColor))
          ),
        ),
      ),
    );
  }
}


