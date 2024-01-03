import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailResetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children:[
            SizedBox(height: 100),
            Text(
          "Forgot Password",
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Color(0xff262628),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:15.0),
               child: Text(
                  "Please enter your registered email id, we will send you a link to reset your password",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                         ),
                       ),
             ),
             const SizedBox(height: 50,),
             Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: TextField(
            controller: _emailResetController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              hintText: "Email Address",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 100),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed:(){},
            style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: const Color(0xFF274560),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                ),
                child: Text(
                  "Send Link",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
        ),
          ]
        ),   
        ),
      );
  }
  @override
  void dispose() {
    _emailResetController.dispose();
    super.dispose();
  }
}



