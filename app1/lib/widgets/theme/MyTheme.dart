import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: GoogleFonts.alike().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: Theme.of(context).textTheme,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
    // primarySwatch: Colors.orange,
        fontFamily: GoogleFonts.alike().fontFamily,
        cardColor: Colors.black,
        canvasColor: Colors.grey[900],
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(
            // color: Colors.black,
          ),
          textTheme: Theme.of(context).textTheme,
        ),
  );
}
