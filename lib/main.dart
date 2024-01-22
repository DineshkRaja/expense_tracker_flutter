import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense_main.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Expense Tracker',
      darkTheme: ThemeData.dark().copyWith(),
      theme: ThemeData(
        useMaterial3: true,
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(250, 206, 147, 216),
          // ···
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(250, 206, 147, 216),
          titleTextStyle:
              GoogleFonts.robotoMono(color: Colors.white, fontSize: 25),
        ),
        cardTheme: const CardTheme().copyWith(
            color: const Color.fromARGB(250, 206, 147, 216),
            elevation: 8,
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8)),
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: GoogleFonts.robotoMono(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          titleMedium:
              GoogleFonts.robotoMono(fontSize: 25, color: Colors.white),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const ExpenseMain(),
    ),
  );
}
