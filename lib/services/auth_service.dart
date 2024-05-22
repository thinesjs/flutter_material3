import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_material3/pages/Home/home.dart';
import 'package:flutter_material3/pages/Login/login.dart';
import 'package:flutter_material3/pages/Main/main.dart';
import 'package:flutter_material3/pages/Register/register.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  static AuthService authInstance = Get.find();
  static late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseUser.bindStream(FirebaseAuth.instance.userChanges());


    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() => const Main());
    } else {
      Get.offAll(() => const Login());
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> signIn(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<void> signUp(String name, String email, String password) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user?.updateDisplayName(name);
      // await credential.user?.sendEmailVerification();
  }

  Future<void> updateProfile(String name, String email, String password, String? phoneNumber) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

  }

}