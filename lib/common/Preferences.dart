import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences _sharedPreferences;
  static const String Onboarding_Done = "isOnboardingDone";
 
  Preferences._();

  static Future<SharedPreferences> init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _sharedPreferences;
  }

  static Future<bool> isOnboardingDone() async {
    init();
    var isOnboardingDone = _sharedPreferences.getBool(Onboarding_Done);
    if (isOnboardingDone != null) {
      return isOnboardingDone;
    } else {
      return false;
    }
  }

  static void setOnboarding(bool value) async {
    init();
    await _sharedPreferences.setBool(Onboarding_Done, value);
  }

  static void clearOnboarding() async {
    init();
    await _sharedPreferences.remove(Onboarding_Done);
  }
}
