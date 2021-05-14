import 'package:ev_stations/constants/pallete.dart';
import 'package:ev_stations/screens/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'map/map_page.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key key}) : super(key: key);
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  PageController pageController;
  int _page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.blackColor,
      body: PageView(
        children: [
          Center(
            child: Text('History'),
          ),
          MapPage(),
          ProfilePage(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CupertinoTabBar(
            backgroundColor: Palette.blackColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.shop,
                    color: (_page == 0)
                        ? Palette.lightBlueColor
                        : Palette.greyColor),
                title: Text(
                  'Shop',
                  style: TextStyle(
                      fontSize: 12,
                      color: (_page == 0)
                          ? Palette.lightBlueColor
                          : Palette.greyColor),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map,
                    color: (_page == 1)
                        ? Palette.lightBlueColor
                        : Palette.greyColor),
                title: Text(
                  'Map',
                  style: TextStyle(
                      fontSize: 12,
                      color: (_page == 1)
                          ? Palette.lightBlueColor
                          : Palette.greyColor),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(AntDesign.profile,
                    color: (_page == 2)
                        ? Palette.lightBlueColor
                        : Palette.greyColor),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 12,
                      color: (_page == 2)
                          ? Palette.lightBlueColor
                          : Palette.greyColor),
                ),
              ),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}