import 'package:flutter/material.dart';
import 'package:to_chat/generated/l10n.dart';
import 'package:to_chat/providers/language_provider.dart';
import 'package:to_chat/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shrinkWrap: true,
          children: [
            Consumer<ThemeProvider>(
              builder: (contextOfthemeProvider, themeProvider,
                  childOfthemeProvider) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(S.of(context).themeMode),
                        // const Spacer(),
                        const SizedBox(
                          width: 100,
                        ),
                        IconButton(
                            onPressed: () {
                              if (themeProvider.currentTheme == 'light') {
                                themeProvider.changeTheme('dark');
                              } else {
                                themeProvider.changeTheme('light');
                              }
                            },
                            icon: Icon(themeProvider.currentTheme == 'light'
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined)),
                      ],
                    ),
                  ),
                );
              },
            ),
            Consumer<LanguageProvider>(
              builder: (contextOfLanguageProvider, valueOfLanguageProvider,
                  childOfLanguageProvider) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(S.of(context).language),
                        // Spacer(),
                        const SizedBox(
                          width: 100,
                        ),
                        IconButton(
                            onPressed: () {
                              if (valueOfLanguageProvider.currentLanguage ==
                                  'ar') {
                                valueOfLanguageProvider.changeTheme('en');
                              } else {
                                valueOfLanguageProvider.changeTheme('ar');
                              }
                            },
                            icon: const Icon(Icons.language_rounded))
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
