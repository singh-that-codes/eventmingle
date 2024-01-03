import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController reenterPasswordController;

  @override
  void initState() {
    super.initState();
    reenterPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Login or Sign Up",
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
                    "Choose between logging in or signing up to continue your journey with us.",
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
                TabBar(
                  tabs: [
                    Tab(
                      text: "Login",
                    ),
                    Tab(
                      text: "Sign Up",
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 300,
                  child: TabBarView(
                    children: [
                      buildLoginContent(),
                      buildSignUpContent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginContent() {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: TextField(
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
          height: 5,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text(
              "Forgot password?",
              style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: const Color(0xff274560),
              ),
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
          onPressed: () {
            // Login logic
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
      ],
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
              hintText: "Reenter Password",
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
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text(
              "Forgot password?",
              style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: const Color(0xff274560),
              ),
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
          onPressed: () {
            String password = reenterPasswordController.text;
            if (validatePassword(password)) {
              // Passwords match, continue with signup
            } else {
              // Passwords do not match, show an error
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
            alignment: Alignment.center, backgroundColor: const Color(0xFF274560),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // Password validation logic
  bool validatePassword(String password) {
    return password == reenterPasswordController.text;
  }

  @override
  void dispose() {
    reenterPasswordController.dispose();
    super.dispose();
  }
}
