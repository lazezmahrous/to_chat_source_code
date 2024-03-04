import 'package:flutter/material.dart';
import 'package:to_chat/constanc.dart';
import 'package:to_chat/generated/l10n.dart';
import 'package:to_chat/pages/home_page.dart';
import 'package:to_chat/pages/settings_page.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});
  static String id = 'HiddenDrawer';

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _itemList = [];
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _itemList = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: S.of(context).homeTitle,
          colorLineSelected: Colors.teal,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
          selectedStyle: const TextStyle(color: Colors.black),
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: S.of(context).settingTitle,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
          colorLineSelected: Colors.white,
          selectedStyle: const TextStyle(color: Colors.black),
        ),
        const SettingPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      initPositionSelected: 0,
      screens: _itemList,
      backgroundColorMenu: Constans.kColorCyan,
      slidePercent: 60,
      elevationAppBar: 0,
      backgroundColorContent: Colors.black,
    );
  }
}
