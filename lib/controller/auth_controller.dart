import 'package:eventmingle/views/auth/create_profile.dart';
import 'package:eventmingle/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;

  void login({String? email, String? password}){
    auth.signInWithEmailAndPassword(email: email!, password: password!)
    .then((value){
      Get.to(() => HomeScreen());
      print('Logged in successfully as $email');
    }).catchError((e){
      print("Failed to log in - $e");
    });
  }
  void signUp({String? email, String? password}){
    auth.createUserWithEmailAndPassword(email: email!, password: password!)
    .then((value){
       Get.to(()=> ProfileScreen());
    }).catchError((e){
      print("Error in authentication $e");
    });

  }
}