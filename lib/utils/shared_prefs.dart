// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const String _recentPdfsKey = "recent_pdfs";
  static const String _darkModeKey = "";
  static const int _maxRecentPdfs = 5;

  static Future<void> setDarkMode(bool value) async {
    await _prefs?.setBool(_darkModeKey, value);
  }

  static List<String> getRecentPdfs() {
    return _prefs?.getStringList(_recentPdfsKey) ?? [];
  }

  static bool isDarkMode() {
    return _prefs?.getBool(_darkModeKey) ?? false;
  }

  static Future<void> clearRecentPdfs() async {
    await _prefs?.remove(_recentPdfsKey);
  }

  static Future<void> addRecentPdf(String filePath) async {
    List<String> recentPdfs = getRecentPdfs();
    recentPdfs.remove(filePath);
    recentPdfs.insert(0, filePath);
    if (recentPdfs.length > _maxRecentPdfs) {
      recentPdfs = recentPdfs.sublist(0, _maxRecentPdfs);
    }
    await _prefs?.setStringList(_recentPdfsKey, recentPdfs);
  }
}
