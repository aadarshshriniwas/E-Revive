import 'package:flutter/material.dart';
String uri='http://192.168.137.108:3000';
class GlobalVariables
{
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromRGBO(118, 255, 122, 1),
      Color.fromRGBO(72,168,96, 1)
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(63 , 112, 77, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

}
