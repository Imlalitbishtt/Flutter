import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
      static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
          cardColor: Colors.white,
          canvasColor: creamColor,
          focusColor: Colors.pinkAccent,
      primaryColor: Colors.black,
      appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color:Colors.black),
      // toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
      titleTextStyle: Theme.of(context).textTheme.headline6,
    )
  );

      static ThemeData darkTheme(BuildContext context) => ThemeData(
          brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            fontFamily: GoogleFonts.poppins().fontFamily,
            cardColor: Colors.black,
            canvasColor: darkCreamColor,
            focusColor: lightBlueColor,
            primaryColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(color:Colors.white),
              // toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
              titleTextStyle: Theme.of(context).textTheme.headline6,
          )
      );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBlueColor = Vx.indigo500;
}
