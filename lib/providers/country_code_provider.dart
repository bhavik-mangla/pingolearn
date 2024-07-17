import 'package:flutter/material.dart';

class CountryCodeProvider with ChangeNotifier {
  String _countryCode = 'in';

  String get countryCode => _countryCode;

  void setCountryCode(String newCode) {
    _countryCode = newCode;
    notifyListeners();
  }
}
