import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/style/theme.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = "is_darkMode";
// save theme to box
  _saveThemetoBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  //

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  ThemeData get theme => _loadThemeFromBox() ? MyTheme.dark() : MyTheme.light();
  void swithTheme() {
    Get.changeTheme(_loadThemeFromBox() ? MyTheme.dark() : MyTheme.light());
    _saveThemetoBox(!_loadThemeFromBox());
  }
}
