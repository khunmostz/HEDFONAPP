import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hedfon_app/screens/home.screen.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _screens = [];

  @override
  void initState() {
    _screens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 1",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.teal,
          selectedStyle: TextStyle(),
        ),
        HomeScreen()));

    // _screens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: "Screen 2",
    //       baseStyle:
    //           TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
    //       colorLineSelected: Colors.orange,
    //     ),
    //     SecondSreen()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.amber.shade700,
      initPositionSelected: 0,
      screens: _screens,
    );
  }
}
