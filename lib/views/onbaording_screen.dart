import 'package:eventmingle/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Welcome to EMS!",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Event Management System",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    color: Colors.black
                  )
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left:20, right:20),
                  child: Image.asset('assets/onboardIcon.png')
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(12), topRight: Radius.circular(12)
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15,right: 15 ),
                          child: Text(
                            "The social media platform designed to get you offline",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                              )
                            ),
                        ),
                        const SizedBox(
                            height: 34,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                                "EventMingle is an app where users can leverage their social networl to create, discover, share, and monetise events and services",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: MaterialButton(
                              onPressed: (){
                               Get.to(()=>LoginPage());
                              },
                              minWidth: double.infinity,
                              color: Colors.white,
                              elevation: 1,
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff274560)
                                    ),
                              ),
                            ),
                          )
                      ],
                    )
                  ),
                ),
                ]
                ),
        ),
        ),
    );
  }
}