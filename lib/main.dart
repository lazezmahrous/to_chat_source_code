import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_chat/constanc.dart';
import 'package:to_chat/generated/l10n.dart';
import 'package:to_chat/models/phone_model.dart';
import 'package:to_chat/providers/language_provider.dart';
import 'package:to_chat/themes/switch_mode.dart';
import 'package:to_chat/providers/theme_provider.dart';
import 'package:to_chat/providers/app_provider.dart';
import 'package:to_chat/widgets/hidden_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تأكد من تهيئة Flutter
  await Hive.initFlutter();
  Hive.registerAdapter(PhoneModelAdapter());
  await Hive.openBox<PhoneModel>(Constans.kphoneNumbersBox);

  // if (kIsWeb) {
  //   try {
  //     databaseFactory = databaseFactoryFfiWeb;
  //     // تهيئة databaseFactory
  //   } catch (e) {
  //     print('Error setting up databaseFactory for web: $e');
  //   }
  // } else {
  //   try {
  //     await SqlDb().intialDb();
  //   } catch (e) {
  //     print('Error initializing database: $e');
  //   }
  // }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ThemeProvider()..initialize(),
    ),
    ChangeNotifierProvider(
      create: (_) => LanguageProvider()..initialize(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // SqlDb sqlDb = SqlDb();
  // @override
  // void initState() {
  //   sqlDb.intialDb();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LanguageProvider>(
      builder: (context, valueOfThemeProvider, valueOfLanguageProvider, child) {
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: valueOfLanguageProvider.language,

          title: 'To Chat',
          themeMode: valueOfThemeProvider.themeMode,
          theme: ThemeClass
              .lightTheme, // applies this theme if the device theme is light mode
          darkTheme: ThemeClass
              .darkTheme, // applies this theme if the device theme is dark mode

          home: const HiddenDrawer(),
        );
      },
    );
  }
}
