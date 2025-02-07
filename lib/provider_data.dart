import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  bool _darkTheme = true;
  bool _viewAll = false;

  // events
  void changeTheme() {
    _darkTheme = _darkTheme ? false : true;
    notifyListeners();
  }

  void changeProjectView() {
    _viewAll = _viewAll ? false : true;
  }

  bool isDark() => _darkTheme;
  bool isViewAll() => _viewAll;
}
