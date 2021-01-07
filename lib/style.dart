import 'package:flutter/cupertino.dart';

abstract class Styles {
  static const TextStyle productRowItemName = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.8),
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal);

  static const TextStyle productRowTotal = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.8),
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal);

  static const TextStyle productRowItemPrice = TextStyle(
    color: Color(0xFF8E8E93),
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );

  static const Color productRowDivider = Color(0xFFD9D9D9);
}
