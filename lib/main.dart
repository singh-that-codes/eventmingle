import 'package:eventmingle/controller/auth_controller.dart';
import 'package:eventmingle/views/onbaording_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';


void main()async {

// ...
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnapFlow',
      theme: ThemeData( 
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme)
      ),
      home: OnboardingScreen(),
    );
  }
}