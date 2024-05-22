import 'package:flutter_material3/pages/Home/Home.dart';
import 'package:flutter_material3/pages/Login/login.dart';
import 'package:flutter_material3/pages/Main/main.dart';
import 'package:flutter_material3/pages/Profile/edit-profile.dart';
import 'package:flutter_material3/pages/Qr/qr-scanner.dart';
import 'package:flutter_material3/pages/Register/register.dart';
import 'package:flutter_material3/pages/Splash/Splash.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splash = "/splash";
  static const String main = "/main";
  static const String home = "/home";
  static const String register = "/register";
  static const String login = "/login";
  static const String editProfile = "/edit-profile";
  static const String qrScanner = "/qr-scanner";


  static String getSplash() => splash;
  static String getMain() => main;
  static String getHome() => home;
  static String getRegister() => register;
  static String getLogin() => login;
  static String getEditProfile() => editProfile;
  static String getQrScanner() => qrScanner;


  static List<GetPage> routes = [
    GetPage(name: splash, page: () {
      return Splash();
    }, transition: null),
    GetPage(name: main, page: () {
      return const Main();
    }, transition: null),
    GetPage(name: home, page: () {
      return const Home();
    }, transition: null),
    GetPage(name: register, page: () {
      return const Register();
    }, transition: null),
    GetPage(name: login, page: () {
      return const Login();
    }, transition: null),
    GetPage(name: editProfile, page: () {
      return const EditProfile();
    }, transition: null),
    GetPage(name: qrScanner, page: () {
      return const QrScanner();
    }, transition: null),

  ];
}