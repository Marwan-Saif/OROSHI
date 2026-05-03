import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oroshi/bages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.kaiseiOptiTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(),
      ),
      title: 'Flutter Demo',
      // theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: SplashScreen(),
    );
  }
}
