// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "hintTextOfButton":
            MessageLookupByLibrary.simpleMessage("Start chat on WhatsApp"),
        "hintTextOfMessage": MessageLookupByLibrary.simpleMessage(
            "You can write a message here"),
        "hintTextOfPhone": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "hintTextOfPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Write the phone number"),
        "homeTitle": MessageLookupByLibrary.simpleMessage("Home Page"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "noNumbers": MessageLookupByLibrary.simpleMessage(
            "There are no numbers to which messages have been sent"),
        "numbersTitle": MessageLookupByLibrary.simpleMessage("My numbers"),
        "phoneNumberContainNumbersOnly": MessageLookupByLibrary.simpleMessage(
            "The phone number must contain numbers only"),
        "phoneNumberIsNull":
            MessageLookupByLibrary.simpleMessage("Please enter phone number"),
        "phoneNumberIswrong":
            MessageLookupByLibrary.simpleMessage("Phone number is incorrect"),
        "settingTitle": MessageLookupByLibrary.simpleMessage("Setting"),
        "showNumbersButton": MessageLookupByLibrary.simpleMessage("My numbers"),
        "snackBarOfNumberCopyed":
            MessageLookupByLibrary.simpleMessage("Phone Number Copied"),
        "textOfPhoneDataSend":
            MessageLookupByLibrary.simpleMessage("Data Time Send"),
        "themeMode": MessageLookupByLibrary.simpleMessage("Theme")
      };
}
