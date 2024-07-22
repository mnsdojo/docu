import 'package:docu/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isDarkMode = false;
  List<String> _recentPdfs = [];
  AppState() {
    _loadStatePrefereces();
  }

  Future<void> _loadStatePrefereces() async {
    _isDarkMode = SharedPrefUtils.isDarkMode();
    _recentPdfs = SharedPrefUtils.getRecentPdfs();
    notifyListeners();
  }

  bool get isDarkMode => _isDarkMode;
  List<String> get recentPdfs => _recentPdfs;

  Future<void> toggleDarkMode() async {
    _isDarkMode = !isDarkMode;
    await SharedPrefUtils.setDarkMode(_isDarkMode);
    notifyListeners();
  }

  Future<void> addRecentPdf(String filePath) async {
    await SharedPrefUtils.addRecentPdf(filePath);
    _recentPdfs = SharedPrefUtils.getRecentPdfs();
    notifyListeners();
  }

  Future<void> clearRecentPdfs() async {
    await SharedPrefUtils.clearRecentPdfs();
    _recentPdfs.clear();
    notifyListeners();
  }
}
