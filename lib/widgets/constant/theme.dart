import 'package:flutter/material.dart';
import 'dimen.dart';

class ThemeUi {
  static const primaryColor = const Color(0xFF32C275);
  static const primaryDarkColor = const Color(0xFF009048);
  static const secondaryColor = const Color(0xFF78909c);
  static const accentColor = const Color(0xFFEDBA00);
  static const backgroudColor = const Color(0xFFf5f5f5);

  static const String _fontName1 = 'Merriweather';
  static const String _fontName2 = 'LibreFranklin';

  static const textTheme = TextTheme(
    headline1: TextStyle(
        fontFamily: _fontName1,
        fontSize: sizeHeadline1,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5),
    headline2: TextStyle(
        fontFamily: _fontName1,
        fontSize: sizeHeadline2,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5),
    headline3: TextStyle(
      fontFamily: _fontName1,
      fontSize: sizeHeadline3,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
        fontFamily: _fontName1,
        fontSize: sizeHeadline4,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    headline5: TextStyle(
      fontFamily: _fontName1,
      fontSize: sizeHeadline5,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
      fontFamily: _fontName1,
      fontSize: sizeHeadline6,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontFamily: _fontName1,
      fontSize: sizeSubtitle1,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontFamily: _fontName1,
      fontSize: sizeSubtitle2,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontFamily: _fontName2,
      fontSize: sizeBody1,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: TextStyle(
      fontFamily: _fontName2,
      fontSize: sizeBody2,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontFamily: _fontName2,
      fontSize: sizeButton,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: TextStyle(
      fontFamily: _fontName2,
      fontSize: sizeCaption,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: TextStyle(
      fontFamily: _fontName2,
      fontSize: sizeOverline,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}
