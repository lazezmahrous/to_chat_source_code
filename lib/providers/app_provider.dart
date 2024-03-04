import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String? _phoneNumber;
  String? _countryCode;
  String? _messageText;

  String? get phoneNumber => _phoneNumber;
  String? get countryCode => _countryCode;
  String? get messageText => _messageText;

  void setPhoneNumber({required String? phoneNumber}) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setCountryCode({required String countryCode}) {
    _countryCode = countryCode;
    // notifyListeners();
  }

  void setMessageText({required String? messageText}) {
    _messageText = messageText;
  }

  Future<List<String>?> getSavedContacts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? savedContacts = prefs.getStringList('phoneNumbers');
    return savedContacts;
  }

  Future<void> refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
  }
}
