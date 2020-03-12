import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;

  CustomButton({
    @required this.onPressed, 
    @required this.buttonText,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 32,
      
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color),
        borderRadius: BorderRadiusDirectional.circular(12)
      ),
      color: color,
      child: Text(buttonText),
      
    );
  }
}