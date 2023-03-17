import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CustomInputDate extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool visible;


  CustomInputDate({Key? key,
    required this.controller,
    required this.hint,
    this.visible = true,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
  }) : super(key: key);

  DateFormat formato = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        height: 44,
        margin: EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          style: TextStyle(
            color: foregroundColor,
          ),
          onTap: () async {
            DateTime? date = DateTime(1900);
            FocusScope.of(context).requestFocus(new FocusNode());
            date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2040)
            );
            if(date != null)
              controller.text = formato.format(date);
            else
              controller.text = "";
          },
          keyboardType: TextInputType.visiblePassword,
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


