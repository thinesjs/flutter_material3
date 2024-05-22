import 'package:flutter_material3/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_material3/firebase_options.dart';


Future<void> init() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((val){
     Get.put<AuthService>(AuthService(), permanent: true);
  });



}
