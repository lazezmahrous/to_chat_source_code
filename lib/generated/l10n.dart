// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home Page`
  String get homeTitle {
    return Intl.message(
      'Home Page',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can write a message here`
  String get hintTextOfMessage {
    return Intl.message(
      'You can write a message here',
      name: 'hintTextOfMessage',
      desc: '',
      args: [],
    );
  }

  /// `Write the phone number`
  String get hintTextOfPhoneNumber {
    return Intl.message(
      'Write the phone number',
      name: 'hintTextOfPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Start chat on WhatsApp`
  String get hintTextOfButton {
    return Intl.message(
      'Start chat on WhatsApp',
      name: 'hintTextOfButton',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get settingTitle {
    return Intl.message(
      'Setting',
      name: 'settingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get themeMode {
    return Intl.message(
      'Theme',
      name: 'themeMode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `My numbers`
  String get numbersTitle {
    return Intl.message(
      'My numbers',
      name: 'numbersTitle',
      desc: '',
      args: [],
    );
  }

  /// `My numbers`
  String get showNumbersButton {
    return Intl.message(
      'My numbers',
      name: 'showNumbersButton',
      desc: '',
      args: [],
    );
  }

  /// `There are no numbers to which messages have been sent`
  String get noNumbers {
    return Intl.message(
      'There are no numbers to which messages have been sent',
      name: 'noNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get phoneNumberIsNull {
    return Intl.message(
      'Please enter phone number',
      name: 'phoneNumberIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is incorrect`
  String get phoneNumberIswrong {
    return Intl.message(
      'Phone number is incorrect',
      name: 'phoneNumberIswrong',
      desc: '',
      args: [],
    );
  }

  /// `The phone number must contain numbers only`
  String get phoneNumberContainNumbersOnly {
    return Intl.message(
      'The phone number must contain numbers only',
      name: 'phoneNumberContainNumbersOnly',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get hintTextOfPhone {
    return Intl.message(
      'Phone Number',
      name: 'hintTextOfPhone',
      desc: '',
      args: [],
    );
  }

  /// `Data Time Send`
  String get textOfPhoneDataSend {
    return Intl.message(
      'Data Time Send',
      name: 'textOfPhoneDataSend',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number Copied`
  String get snackBarOfNumberCopyed {
    return Intl.message(
      'Phone Number Copied',
      name: 'snackBarOfNumberCopyed',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
