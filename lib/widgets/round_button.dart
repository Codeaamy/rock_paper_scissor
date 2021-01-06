import 'package:flutter/cupertino.dart';

Widget customRoundButton(BuildContext context, double width, double height, String title, double fontSize, Color textColor, Color buttonColor, Function onPressed){
  return GestureDetector(
    child: Container(
      width: width,
      height: height,
      child: Center(
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: textColor, fontSize: fontSize),),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(10))

      ),
    ),
    onTap: onPressed,
  );
}