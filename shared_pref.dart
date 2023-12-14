// shared_preference_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static const String sharedPreferencesNameKey = 'name';
  static const String sharedPreferencesEmailKey = 'email';

  static Future<void> saveLoginState(String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sharedPreferencesNameKey, name);
    prefs.setString(sharedPreferencesEmailKey, email);
  }

  static Future<void> clearLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(sharedPreferencesNameKey);
    prefs.remove(sharedPreferencesEmailKey);
  }
}
