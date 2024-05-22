import 'package:flutter/material.dart';
import 'package:flutter_material3/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Material3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      initialRoute: RouteHelper.getSplash(),
      getPages: RouteHelper.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}