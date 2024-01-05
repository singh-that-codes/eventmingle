// login_page.dart
import 'package:eventmingle/controller/auth_controller.dart';
import 'package:eventmingle/views/auth/signUp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              "Login",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "Welcome back, Plz Sign in and continue your journey with us",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            buildFormContent(),
            ElevatedButton(
              onPressed: () {
                authController.login(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: const Color(0xFF274560),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Or Connect With",
              style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: const Color(0xff274560),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/fb.png'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/insta.png'),
                  ),
                  IconButton(
                    onPressed: () {
                      AuthController().signInWithGoogle();
                    },
                    icon: Image.asset('assets/google.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            TextButton(
              onPressed: () {
                Get.to(()=>SignUpPage()); // Navigate to the signup page
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormContent() {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
            ),
            obscureText: true,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
