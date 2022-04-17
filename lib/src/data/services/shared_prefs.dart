import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static int? _userId;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int? get userId => _prefs.getInt('userId');
  set userId(int? value) => _prefs.setInt('userId', value!);

  Future<bool> removeUserId() => _prefs.remove('userId');
}
