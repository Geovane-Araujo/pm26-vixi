import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  final Color backgroundColor;
  final Color foregroundColor;
  final String router;
  final String hint;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.router = "",
    required this.hint,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        margin: EdgeInsets.only(left: 10,right: 10),
        width: MediaQuery.of(context).size.width/1,
        height: 50,
        padding: EdgeInsets.only(top:4, bottom: 4),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor
          ),
          onPressed: onPressed,
          child: Text(hint),
        )
    );
  }
}
