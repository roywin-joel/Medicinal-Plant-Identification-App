import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leaf_snap/constants.dart';
import 'package:leaf_snap/main.dart';
import 'package:leaf_snap/models/plants.dart';
import 'package:leaf_snap/ui/login_page.dart';
import 'package:leaf_snap/ui/screens/detail_page.dart';
import 'package:leaf_snap/ui/screens/home_page.dart';
import 'package:leaf_snap/ui/screens/profile_page.dart';
import 'package:leaf_snap/ui/screens/scan_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';

class RootPage extends StatefulWidget {
  //late final StreamController<Locale> localeController;
  RootPage({
    super.key,
    /*required this.localeController*/
  });

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //stream controller
  Locale localeNew = Locale('en', 'US');

  // final List locale = [
  //   {'name': 'English', 'loacale': Locale('en', 'US')},
  //   {'name': 'Kannada', 'loacale': Locale('kn', 'IN')},
  //   {'name': 'Hindi', 'loacale': Locale('hi', 'IN')}
  // ];
  String _selectedLanguage = 'English';
  //try
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45),
        ),
      ),
      context: context,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: ScanPage(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        );
      },
    );
  }

  //try
  List<Plant> favorites = [];
  List<Plant> myCart = [];
  int _bottomNavIndex = 0;

  //list of pages
  List<Widget> pages = [
    HomePage(
        //locale: Locale('ka'),
        ),
    //FavouritePage(),
    //CartPage(),
    ProfilePage(),
  ];

  //list of pages icons

  List<IconData> iconList = [
    Icons.home,
    //Icons.favorite,
    //Icons.shopping_cart,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    //'Favorite',
    //'Cart',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () {
    //   Get.updateLocale(localeNew); // Update locale to French
    // });
    // setState(() {
    //   Get.updateLocale(localeNew);
    // });
    // setState(() {
    //   Future.delayed(Duration.zero, () {
    //     Get.updateLocale(localeNew); // Update locale to French
    //   });
    // });
    List<String> _languages = ['English', 'Kannada', 'Hindi'];
    //print(localeNew);
    //start
    //end
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            /*Text(
              'plantName1'.tr,
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),*/
            // Icon(
            //   Icons.language,
            //   color: Constants.blackColor,
            //   size: 30,
            // ),
            DropdownButton<String>(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Constants.blackColor,
                size: 30,
              ),
              onChanged: (newValue) {
                //print("hi");
                //Get.updateLocale(Locale('ka', 'IN'));
                //setState(() {
                _selectedLanguage = newValue!;
                // var locale = Locale('ka', 'IN');
                // Get.updateLocale(locale);
                //print(newValue);
                if (newValue == 'English') {
                  //MyApp.setLocale(context, Locale('en', 'US'));
                  localeNew = Locale('en', 'US');
                  //widget.localeController.add(Locale('en', 'US'));
                  Get.updateLocale(localeNew);
                } else if (newValue == 'Kannada') {
                  //MyApp.setLocale(context, Locale('ka', 'IN'));
                  localeNew = Locale('ka', 'IN');
                  //widget.localeController.add(Locale('ka', 'IN'));
                  Get.updateLocale(localeNew);
                  // Future.delayed(Duration.zero, () {
                  //   Get.updateLocale(Locale('ka')); // Update locale to French
                  // });
                } else {
                  //MyApp.setLocale(context, Locale('hi', 'IN'));
                  localeNew = Locale('hi', 'IN');
                  //widget.localeController.add(Locale('hi', 'IN'));
                  Get.updateLocale(localeNew);
                }
                //});
              },
              value: _selectedLanguage,
              items: _languages.map((language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(
                    language,
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     PageTransition(
          //         child: ScanPage(), type: PageTransitionType.bottomToTop));
          _showModalBottomSheet(context);
        },
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            // final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            // final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

            // favorites = favoritedPlants;
            // myCart = addedToCartPlants.toSet().toList();
          });
        },
      ),
    );
  }
}
