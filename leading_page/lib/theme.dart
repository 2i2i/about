import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme _singleton = AppTheme._internal();

  AppTheme._internal();

  factory AppTheme() {
    return _singleton;
  }

  Color primaryColor = const Color(0xFFf3f3f7);
  Color primaryLightColor = const Color(0xFFffffff);
  Color primaryDarkColor = const Color(0x90000000);

  Color secondaryColor = const Color(0xFF23d67d);
  Color shadowColor = const Color(0xFFDCF9EB);
  Color secondaryDarkColor = const Color(0xFF23D67D);

  Color cardDarkColor = const Color.fromRGBO(54, 54, 71, 1);
  Color disableColor = const Color(0xFF979592);
  Color fillColor = const Color(0xFFC1C1D7);

  Color lightSecondaryTextColor = const Color(0xff8E8E93);

  Color darkSecondaryTextColor = Colors.white;

  ThemeData mainTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      primaryColorLight: primaryLightColor,
      primaryColorDark: primaryDarkColor,
      scaffoldBackgroundColor: primaryColor,
      shadowColor: fillColor,
      disabledColor: disableColor,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      colorScheme: ColorScheme.light(
        secondary: secondaryColor,
      ),
      cardColor: cardDarkColor,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primaryDarkColor),
      ),
      iconTheme: IconThemeData(
        color: cardDarkColor
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: secondaryColor,
        unselectedItemColor: disableColor,
        backgroundColor: primaryLightColor,
        selectedIconTheme: const IconThemeData(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: secondaryColor,
          padding: EdgeInsets.all(kIsWeb ? 22 : 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            primary: secondaryColor,
            padding: EdgeInsets.all(kIsWeb ? 22 : 14),
            side: BorderSide(color: secondaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            )),
      ),
      fontFamily: 'SofiaPro',
      textTheme: TextTheme(
        headline3: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w800,
            fontSize: 44,
            color: Color.fromRGBO(40, 40, 86, 1)),
        headline4: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 34,
          // color: Color(0xff8E8E93),
        ),
        headline5: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w800,
          fontSize: 28,
          // color: Color(0xff8E8E93),
        ),
        headline6: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Color(0xFFf3f3f7),
        ),
        subtitle1: const TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: Color.fromRGBO(40, 40, 86, 0.6),
        ),
        subtitle2: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w800,
          fontSize: 14,
          // color: Colors.black,
        ),
        bodyText1: TextStyle(
          // fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w300,
          fontSize: 16,
          color: lightSecondaryTextColor,
        ),
        bodyText2: const TextStyle(
          fontStyle: FontStyle.normal,
          // fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
        /*bodyText2: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          // color: Colors.black,
        ),*/
        caption: const TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 12,
          // color: Color(0xff8E8E93),
        ),
      ),
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryDarkColor,
      primaryColorLight: secondaryDarkColor,
      primaryColorDark: primaryLightColor,
      primaryColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: primaryDarkColor,
      iconTheme: IconThemeData(color: primaryColor),
      cardColor: cardDarkColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: secondaryDarkColor,
        unselectedItemColor: disableColor,
        backgroundColor: primaryDarkColor,
        selectedIconTheme: IconThemeData(color: secondaryDarkColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: secondaryDarkColor,
          padding: EdgeInsets.all(kIsWeb ? 22 : 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            primary: secondaryDarkColor,
            padding: EdgeInsets.all(kIsWeb ? 22.0 : 14.0),
            side: BorderSide(color: secondaryDarkColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            )),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: secondaryDarkColor,
          padding: EdgeInsets.all(kIsWeb ? 22 : 14),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryLightColor,
      ),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: primaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: cardDarkColor,
        iconColor: fillColor,
        labelStyle: TextStyle(color: secondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      colorScheme: ColorScheme.dark(secondary: secondaryDarkColor),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: primaryLightColor),
      fontFamily: 'SofiaPro',
      textTheme: TextTheme(
        headline4: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 34,
          color: darkSecondaryTextColor,
        ),
        headline5: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w800,
          fontSize: 28,
          color: darkSecondaryTextColor,
          // color: Color(0xff8E8E93),
        ),
        headline6: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: darkSecondaryTextColor,
        ),
        subtitle1: TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: darkSecondaryTextColor,
          // color: Color(0xff8E8E93),
        ),
        subtitle2: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w800,
          fontSize: 14,
          color: darkSecondaryTextColor,
          // color: Colors.black,
        ),
        bodyText1: TextStyle(
          // fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w300,
          fontSize: 16,
          color: darkSecondaryTextColor,
        ),
        bodyText2: TextStyle(
          fontStyle: FontStyle.normal,
          // fontWeight: FontWeight.bold,
          fontSize: 14,
          // color: Colors.black,
          color: darkSecondaryTextColor,
        ),
        /*bodyText2: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          // color: Colors.black,
        ),*/
        caption: TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 12,
          color: darkSecondaryTextColor,
          // color: Color(0xff8E8E93),
        ),
        button: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17,
            color: darkSecondaryTextColor
            // color: Color(0xff8E8E93),
            ),
      ),
    );
  }
}
