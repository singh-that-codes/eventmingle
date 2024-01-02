import 'package:eventmingle/views/login_screen.dart';
import 'package:eventmingle/views/onbaording_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnapFlow',
      theme: ThemeData( 
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme)
      ),
      initialRoute: '/',
      routes:{
        '/': (context)=> OnboardingScreen(),
        '/loginPage': (context)=> LoginPage(),
      }
    );
  }
}