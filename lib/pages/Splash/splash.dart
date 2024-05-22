import 'package:flutter/material.dart';
import 'package:flutter_material3/pages/Onboarding/onboarding.dart';
import 'package:flutter_material3/routes/routes.dart';
import 'package:flutter_material3/services/auth_service.dart';
import 'package:flutter_material3/utils/dependencies.dart' as dependencies;
import 'package:get/get.dart';

class Splash extends StatelessWidget {


  // Future<void> initializeSettings() async {
  //   await dependencies.init();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dependencies.init(),
      builder: (context, snapshot) {
        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          )
        );
      },
    );
  }
}