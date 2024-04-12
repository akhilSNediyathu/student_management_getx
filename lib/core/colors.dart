import 'package:flutter/material.dart';

class Tcolo {
  static Color get primarycolor1 => const Color(0xff92A3FD);
  static Color get primarycolor2 => const Color(0xff9DCEFF);

  static Color get secondarycolor1 => const Color(0xffC58BF2);
  static Color get secondarycolor2 => const Color(0xffEEA4CE);
   static Color get tertiarycolor1 => const Color(0xff996C65);
  static Color get tertiarycolor2 => const Color(0xff92A3FD);

  static List<Color> get primaryG => [primarycolor2, primarycolor1];
  static List<Color> get secondaryG => [secondarycolor1, secondarycolor2];
  static List<Color> get tertiaryG => [tertiarycolor1, tertiarycolor2];
  static List<Color> get cardBg => [Colors.blue,Colors.green ];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightgrey => const Color(0xffF7F8F8);
}
