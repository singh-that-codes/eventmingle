import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 50,),
          Text(
            "Login",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
            )
            )
            ),
            SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              "Welcome back, Plz Sign in and continue your journey with us",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
              )
              )
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(

                onPressed: () {},
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    color: Color(0xff274560),
                    textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,)
                  )
                ),
              ),
              TextButton(
              onPressed: () {},
              child: Text(
                "SignUp",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Color(0xff274560),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))),
            ),
            ],
          ),
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
              prefixIcon: Icon(Icons.email_outlined),
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
            ),
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
                color: Color(0xff274560)
              )
              ),
          onPressed: (){},
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF274560)
              ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust the radius as needed
                ),
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
        ),
        const SizedBox(height: 25),
        Text(
          "Or Connect With",
          style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Color(0xff274560))
        ),
        const SizedBox(height: 25,),
        Container(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){},
                icon: Image.asset('assets/fb.png')
              ),
              IconButton(
                onPressed: (){},
                icon: Image.asset('assets/insta.png')
              ),
              IconButton(
                onPressed: () {}, 
                icon: Image.asset('assets/google.png')
              ),
            ],
          ),
        )
        ],
      )
      )
    );
  }
}


