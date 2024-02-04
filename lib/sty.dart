import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration loginBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(150.0)),
    color: Colors.white38,
    boxShadow: [
      BoxShadow(
          color: Colors.black12, blurRadius: 10.0, offset: Offset(0.0, 10.0))
    ]);

TextStyle buttonTextStyle = TextStyle(
  color: Colors.green[400],
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

Color bgColor = Colors.white38;

TextStyle textHint = TextStyle(

    color: Colors.white54,
    fontSize: 25,
    fontWeight: FontWeight.bold);