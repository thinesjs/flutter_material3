import 'package:flutter/material.dart';
import 'package:flutter_material3/pages/Main/main.dart';
import 'package:flutter_material3/pages/Register/register.dart';
import 'package:flutter_material3/services/auth_service.dart';
import 'package:get/get.dart';

// class Onboarding extends StatelessWidget {
//   const Onboarding({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AuthService _authService = Get.find<AuthService>();

//     return Obx(() {
//       return _authService.isLogged.value ? Main() : Register();
//     });
//   }
// }