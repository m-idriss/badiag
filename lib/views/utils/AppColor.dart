import 'package:flutter/material.dart';

class AppColor {
  static Color primary = Color.fromARGB(255, 2, 48, 86);
  static Color primarySoft = Color.fromARGB(255, 3, 71, 131);
  static Color primaryExtraSoft = Color(0xFFEEF4F4);
  static Color secondary = Colors.lime;
  static Color whiteSoft = Colors.grey.shade100;
  static LinearGradient bottomShadow = LinearGradient(
      colors: [primary.withOpacity(0.2), primary.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static LinearGradient linearBlackBottom = LinearGradient(
      colors: [Colors.black.withOpacity(0.45), Colors.black.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static LinearGradient linearBlackTop = LinearGradient(
      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static RadialGradient bottomGradient = RadialGradient(colors: [
    Color.fromARGB(255, 255, 255, 255).withOpacity(0),
    primary.withOpacity(0.5),
  ]);
}
