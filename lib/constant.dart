// Color Pallet

import 'package:flutter/material.dart';

const blackColour = Color(0xff3a4645);
const orangeColour = Color(0xffe97a25);
const yellowColour = Color(0xfffcde79);
const redColour = Color(0xffd81c1f);
const greyColour = Color(0xffc5c6c1);

const titleTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

const scoreTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

double getWidth (BuildContext context){
  var width = MediaQuery.of(context).size.width;
  return width;
}

double getHeight (BuildContext context){
  var height = MediaQuery.of(context).size.height;
  return height;
}

