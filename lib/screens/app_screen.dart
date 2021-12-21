import 'package:bilibili/screens/url_parse_screen.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'components/drawer_menu.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  var _selectedIndex = 0;
  final _pageViewController = PageController(initialPage: 0);

  late final _pageView = PageView(
    children: const [
      UrlParseScreen(),
    ],
    controller: _pageViewController,
    onPageChanged: _onPage,
  );

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  Future _onPage(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 1),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      isDraggable: false,
      curveAnimation: Curves.ease,
      menu: const DrawerMenu(),
      screenSelectedBuilder:
          (int position, SimpleHiddenDrawerController controller) {
        return Scaffold(
          body: _pageView,
        );
      },
    );
  }
}
