// signup_page.dart
import 'package:eventmingle/controller/auth_controller.dart';
import 'package:eventmingle/views/auth/create_profile.dart';
import 'package:eventmingle/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController reenterPasswordController;
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    reenterPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Sign Up",
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
                "Create an account to get started",
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
            buildSignUpContent(),
            ElevatedButton(
              onPressed: () {
                String password = reenterPasswordController.text;
                if (validatePassword(password)) {
                  authController.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  Get.to(()=>ProfileScreen());

                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text("Passwords do not match."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: const Color(0xFF274560),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Next",
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
                Get.to(()=>LoginPage()); // Navigate to the login page
              },
              child: Text(
                "Already have an account? Login",
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

  Widget buildSignUpContent() {
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
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: TextField(
            controller: reenterPasswordController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              hintText: "Re-enter Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
            ),
            obscureText: true,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }

  bool validatePassword(String password) {
    return password == reenterPasswordController.text;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reenterPasswordController.dispose();
    super.dispose();
  }
}
