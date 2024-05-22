import 'package:flutter_material3/utils/cache/cache_enums.dart';

import 'cache_manager.dart';

class AuthCacheManager {
  Future<bool> isFirstEntry() async {
    return !(await CacheManager.getBool(CacheEnums.onboarding.path) ?? false);
  }

  Future<bool> isLoggedIn() async {
    return (await CacheManager.getBool(CacheEnums.login.path)) ?? false;
  }

  Future<void> signOut() async {
    await CacheManager.clearAll();
  }

  Future<void> updateFirstEntry() async {
    await CacheManager.setBool(CacheEnums.onboarding.path, true);
  }

  Future<void> updateLoggedIn(bool isLoggedIn) async {
    await CacheManager.setBool(CacheEnums.login.path, isLoggedIn);
  }

  // Future<void> updateToken(String? token) async {
  //   if (token != null) {
  //     await CacheManager.setString(NetworkEnums.token.path, token);
  //     DioManager.instance.dio.options
  //         .headers[(MapEntry('Authorization', 'token $token'))];
  //   } else {
  //     if (await CacheManager.containsKey(NetworkEnums.token.path)) {
  //       await CacheManager.remove(NetworkEnums.token.path);
  //       DioManager.instance.dio.options.headers.clear();
  //     }
  //   }
  // }

  // Future<void> updateTokenFromStorage() async {
  //   if (await CacheManager.containsKey(NetworkEnums.token.path)) {
  //     final token = await CacheManager.getString(NetworkEnums.token.path);
  //     if (token != null) {
  //       DioManager.instance.dio.options
  //           .headers[(MapEntry('Authorization', 'token $token'))];

  //       /// Actually, we will not need it for this application.
  //       /// But I've included it here for instructive purposes.
  //     }
  //   }
  // }
}