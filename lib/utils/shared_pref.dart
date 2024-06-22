// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late final SharedPreferences prefs;
  static Future<SharedPreferences> init() async =>
      prefs = await SharedPreferences.getInstance();

  static const String DEVICE_TYPE = 'DEVICE_TYPE',
      THEME_MODE = 'THEME_MODE',
      IS_LOGGED_IN = 'IS_LOGGED_IN',
      ACCOUNT_ID = 'ACCOUNT_ID',
      ACCOUNT_EMAIL = 'ACCOUNT_EMAIL';

  static String getDeviceType() {
    return prefs.getString(DEVICE_TYPE) ?? 'mobile';
  }

  static Future<bool> setDeviceType(String value) async {
    return await prefs.setString(DEVICE_TYPE, value);
  }

  static String getThemeMode() {
    return prefs.getString(THEME_MODE) ?? 'light';
  }

  static Future<bool> setThemeMode(String value) async {
    return await prefs.setString(THEME_MODE, value);
  }

  static bool getIsLoggedIn() {
    return prefs.getBool(IS_LOGGED_IN) ?? false;
  }

  static Future<bool> setIsLoggedIn(bool value) async {
    return await prefs.setBool(IS_LOGGED_IN, value);
  }

  static String getAccountId() {
    return prefs.getString(ACCOUNT_ID) ?? '';
  }

  static String getAccountEmail() {
    return prefs.getString(ACCOUNT_EMAIL) ?? 'Guest User';
  }

  static setUserInfo(String id, String email) async {
    await prefs.setString(ACCOUNT_ID, id);
    await prefs.setString(ACCOUNT_EMAIL, email);
  }
}
