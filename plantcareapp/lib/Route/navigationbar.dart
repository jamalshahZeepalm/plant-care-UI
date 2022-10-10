import 'package:flutter/material.dart';
import 'package:plantcareapp/Uitls/colors.dart';
import 'package:plantcareapp/Uitls/icondata.dart';

import '../Uitls/page_routing.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.kWhite,
      child: Scaffold(
        body: page[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            elevation: 0,
            backgroundColor: CustomColors.kWhite,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: CustomColors.kDarkOrange,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  CustomIconData.kHome,
                  color: CustomColors.kGrey,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    CustomIconData.kBarChart,
                    color: CustomColors.kGrey,
                  ),
                  label: ' '),
              BottomNavigationBarItem(
                  icon: Icon(
                    CustomIconData.kScreenshot,
                    color: CustomColors.kDarkOrange,
                  ),
                  label: ' '),
              BottomNavigationBarItem(
                  icon: Icon(
                    CustomIconData.kNotification,
                    color: CustomColors.kGrey,
                  ),
                  label: ' '),
              BottomNavigationBarItem(
                  icon: Icon(
                    CustomIconData.kSettings,
                    color: CustomColors.kGrey,
                  ),
                  label: ''),
            ]),
      ),
    );
  }
}
