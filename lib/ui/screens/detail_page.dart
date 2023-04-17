// import 'package:flutter/material.dart';
// import 'package:leaf_snap/constants.dart';
// import 'package:leaf_snap/models/plants.dart';
// import 'package:get/get.dart';

// class DetailPage extends StatefulWidget {
//   final int plantId;
//   DetailPage({super.key, required this.plantId});

//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     List<Plant> _plantList = Plant.plantList;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 50,
//             left: 20,
//             right: 20,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       color: Constants.primaryColor.withOpacity(.15),
//                     ),
//                     child: Icon(
//                       Icons.close,
//                       color: Constants.primaryColor,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       color: Constants.primaryColor.withOpacity(.15),
//                     ),
//                     child: Icon(
//                       _plantList[widget.plantId].isFavorated == true
//                           ? Icons.favorite
//                           : Icons.favorite_border,
//                       color: Constants.primaryColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 100,
//             left: 20,
//             right: 20,
//             child: Container(
//               width: size.width * .8,
//               height: size.height * .8,
//               padding: EdgeInsets.all(20),
//               child: Stack(
//                 children: [
//                   Positioned(
//                       top: 10,
//                       left: 50,
//                       right: 50,
//                       child: SizedBox(
//                         height: 350,
//                         child: Image.asset(_plantList[widget.plantId].imageURL),
//                       )),
//                   // Positioned(
//                   //   top: 10,
//                   //   right: 0,
//                   //   child: SizedBox(
//                   //     height: 200,
//                   //     child: Column(
//                   //       crossAxisAlignment: CrossAxisAlignment.start,
//                   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //       children: [
//                   //         PlantFeature(
//                   //           title: 'size',
//                   //           plantFeature: _plantList[widget.plantId].size,
//                   //         ),
//                   //         PlantFeature(
//                   //           title: 'humidity',
//                   //           plantFeature:
//                   //               _plantList[widget.plantId].humidity.toString(),
//                   //         ),
//                   //         PlantFeature(
//                   //           title: 'temperature',
//                   //           plantFeature:
//                   //               _plantList[widget.plantId].temperature,
//                   //         ),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.only(top: 80, left: 30, right: 30),
//               height: size.height * .5,
//               width: size.width,
//               decoration: BoxDecoration(
//                 color: Constants.primaryColor.withOpacity(.4),
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(30),
//                     topLeft: Radius.circular(30)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             _plantList[widget.plantId].plantName.tr,
//                             style: TextStyle(
//                               color: Constants.primaryColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 30,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Expanded(
//                     child: Text(
//                       _plantList[widget.plantId].decription.tr,
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(
//                         height: 1.2,
//                         fontSize: 18,
//                         color: Constants.blackColor.withOpacity(.7),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PlantFeature extends StatelessWidget {
//   final String plantFeature;
//   final String title;
//   const PlantFeature(
//       {super.key, required this.plantFeature, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: Constants.blackColor,
//           ),
//         ),
//         Text(
//           plantFeature,
//           style: TextStyle(
//             color: Constants.primaryColor,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//           ),
//         )
//       ],
//     );
//   }
// }
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:get/get.dart';
import 'package:leaf_snap/constants.dart';
import 'package:flutter/material.dart';
import 'package:leaf_snap/models/plants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DetailPage extends StatefulWidget {
  final int plantID;
  const DetailPage({Key? key, required this.plantID}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(0.15),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('favorite');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(0.15),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            bool isFavorited = toggleIsFavorated(
                                _plantList[widget.plantID].isFavorated);
                            _plantList[widget.plantID].isFavorated =
                                isFavorited;
                          });
                        },
                        icon: Icon(
                          _plantList[widget.plantID].isFavorated == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Color.fromRGBO(75, 117, 89, 9),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 85,
            left: 0,
            right: 20,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        depth: 5,
                        intensity: 0.7,
                        color: const Color.fromRGBO(125, 180, 50, 170),
                        shadowDarkColor: Colors.grey,
                        shadowLightColor: Colors.white,
                      ),
                      child: Container(
                        height: 300,
                        width: 300,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              right: 10,
                              top: 20,
                              bottom: 30,
                              child: Image.asset(
                                _plantList[widget.plantID].imageURL,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ), //image
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 80, left: 30, right: 30),
                      height: size.height * 0.49,
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _plantList[widget.plantID].plantName.tr,
                                    style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   _plantList[widget.plantID].category.toString(),
                              //   style: TextStyle(
                              //     color: Constants.blackColor,
                              //     fontSize: 24.0,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 5.0,
                              // ),
                              // Text(
                              //   _plantList[widget.plantID].decription,
                              //   textAlign: TextAlign.justify,
                              //   style: TextStyle(
                              //     height: 1.5,
                              //     fontSize: 18,
                              //     color: Constants.blackColor.withOpacity(0.7),
                              //   ),
                              // ),
                              Column(
                                children: [
                                  Container(
                                    height: 250,
                                    width: double.infinity,
                                    child: PageView(
                                      children: [
                                        Container(
                                          height: 250,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 50, horizontal: 0),
                                          color: Colors.white,
                                          child: Text(
                                            _plantList[widget.plantID]
                                                .decription
                                                .tr,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 250,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 50, horizontal: 0),
                                          color: Colors.white,
                                          child: Text(
                                            _plantList[widget.plantID]
                                                .decription
                                                .tr,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 250,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 50, horizontal: 0),
                                          color: Colors.white,
                                          child: Text(
                                            _plantList[widget.plantID]
                                                .decription
                                                .tr,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                      onPageChanged: (index) {
                                        setState(() {
                                          pageIndex = index;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CarouselIndicator(
                                    color: Colors.grey,
                                    count: 3,
                                    index: pageIndex,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
