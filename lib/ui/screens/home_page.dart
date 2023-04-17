import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaf_snap/constants.dart';
import 'package:leaf_snap/models/plants.dart';
import 'package:leaf_snap/ui/screens/detail_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  //Locale locale;
  HomePage({
    super.key,
    /*required this.locale*/
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   Locale locale = widget.locale;
    //   print("setstae");
    //   Get.updateLocale(locale);
    // });

    int selectIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;
    List<String> _plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];

    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        const Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Search Plant',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              height: 30.0,
              width: size.width,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 12.0,
            //   ),
            //   height: 50.0,
            //   width: size.width,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: _plantTypes.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               selectIndex = index;
            //             });
            //           },
            //           child: Text(
            //             _plantTypes[index],
            //             style: TextStyle(
            //               fontSize: 16.0,
            //               fontWeight: selectIndex == index
            //                   ? FontWeight.bold
            //                   : FontWeight.w300,
            //               color: selectIndex == index
            //                   ? Constants.primaryColor
            //                   : Constants.blackColor,
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(
                                  plantID: _plantList[index].plantId,
                                ),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              right: 20,
                              child: Container(
                                height: 50,
                                width: 50,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bool isFavorited = toggleIsFavorated(
                                          _plantList[index].isFavorated);
                                      _plantList[index].isFavorated =
                                          isFavorited;
                                      //Get.updateLocale(Locale('ka', ''));
                                    });
                                  },
                                  icon: Icon(
                                    _plantList[index].isFavorated == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Constants.primaryColor,
                                  ),
                                  color: Constants.primaryColor,
                                  iconSize: 30,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              right: 50,
                              top: 50,
                              bottom: 50,
                              child: Image.asset(_plantList[index].imageURL),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   _plantList[index].category,
                                  //   style: TextStyle(
                                  //     color: Colors.white70,
                                  //     fontSize: 16,
                                  //   ),
                                  // ),
                                  Text(
                                    _plantList[index].plantName.tr,
                                    //AppLocalizations.of(context)!.plantName1,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Positioned(
                            //   bottom: 15,
                            //   right: 20,
                            //   child: Container(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 10, vertical: 2),
                            //     decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(20),
                            //     ),
                            //     child: Text(
                            //       r'$' + _plantList[index].price.toString(),
                            //       style: TextStyle(
                            //           color: Constants.primaryColor,
                            //           fontSize: 16),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: Text(
                'New Plants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(
                                  plantID: _plantList[index].plantId,
                                ),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80.0,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        margin: EdgeInsets.only(left: 10, top: 10),
                        width: size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Constants.primaryColor
                                          .withOpacity(.8),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 0,
                                    right: 0,
                                    child: SizedBox(
                                      height: 80.0,
                                      child: Image.asset(
                                          _plantList[index].imageURL),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _plantList[index].plantName.tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Constants.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
