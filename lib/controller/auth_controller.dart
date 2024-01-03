import 'package:eventmingle/views/auth/create_profile.dart';
import 'package:eventmingle/views/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Add the isLoginForm property
  var isLoginForm = true.obs;

  void toggleForm() {
    isLoginForm.value = !isLoginForm.value;
  }

  void login({String? email, String? password}) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      Get.to(() => HomeScreen());
      print('Logged in successfully as $email');
    }).catchError((e) {
      print("Failed to log in - $e");
    });
  }

  void signUp({String? email, String? password}) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      Get.to(() => ProfileScreen());
    }).catchError((e) {
      print("Error in authentication $e");
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        // User canceled Google Sign-In
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _firebaseAuth.signInWithCredential(authCredential);

      Get.to(() => ProfileScreen());
    } catch (error) {
      print("Google Sign-In Error: $error");
    }
  }
}
