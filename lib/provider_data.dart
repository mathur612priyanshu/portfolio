import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  bool _darkTheme = false;

  // events
  void changeTheme() {
    _darkTheme = _darkTheme ? false : true;
    notifyListeners();
  }

  bool isDark() => _darkTheme;
}
