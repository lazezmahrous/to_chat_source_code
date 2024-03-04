import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_chat/constanc.dart';
import 'package:to_chat/database/sqldb.dart';
import 'package:to_chat/models/phone_model.dart';
import 'package:url_launcher/url_launcher.dart';

class StartChat {
  SqlDb sqlDb = SqlDb();

  Future<void> startChat(
      {required String phoneNumber,
      required String messageText,
      required String countryCode}) async {
    String url = 'https://wa.me/$countryCode$phoneNumber/?text=$messageText';

    await launch(url);
  }

  Future<void> startChatWithOutCountryCode({
    required String phoneNumber,
    String? messageText,
  }) async {
    String url = 'https://wa.me/$phoneNumber/?text=$messageText';

    await launch(url);
  }

  Future<String> saveContact({
    required PhoneModel phoneNumber,
  }) async {
    String res = '';
    try {
      var phoneNumbersBox = Hive.box<PhoneModel>(Constans.kphoneNumbersBox);
      await phoneNumbersBox.add(phoneNumber);
    } catch (e) {
      res = e.toString();
    }
          return res;

  }

  //SharedPreferences
  Future<void> deleteContact(String phoneNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? savedContacts = prefs.getStringList('phoneNumbers');

    if (savedContacts != null && savedContacts.contains(phoneNumber)) {
      savedContacts.remove(phoneNumber);
      await prefs.setStringList('phoneNumbers', savedContacts);
    }
  }

  //SharedPreferences
  Future<List<String>?> getSavedContacts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? savedContacts = prefs.getStringList('phoneNumbers');

    return savedContacts;
  }
}
