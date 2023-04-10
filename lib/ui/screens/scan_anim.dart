import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leaf_snap/models/plants.dart';
import 'package:leaf_snap/ui/screens/detail_page.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class ScannerAnim extends StatefulWidget {
  final FileImage f;
  const ScannerAnim({super.key, required this.f});

  @override
  State<ScannerAnim> createState() => _ScannerAnimState();
}

class _ScannerAnimState extends State<ScannerAnim> {
  List<Plant> _plantList = Plant.plantList;
  @override
  Widget build(BuildContext context) {
    setState(() {
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: DetailPage(
                  plantId: _plantList[0].plantId,
                ),
                type: PageTransitionType.bottomToTop));
      });
    });
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: widget.f, fit: BoxFit.contain),
              ),
            ),
          ),
          Center(
            child: Lottie.asset(
              'animations/scanner_anim.json',
              // width: 300,
              // height: 300,
              reverse: true,
              repeat: true,
              //fit: BoxFit.cover
            ),
          ),
          // Center(
          //   child: Image.asset('assets/crop.png'),
          // ),
          Center(
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/crop.png'),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          // Positioned(
          //   top: 600,
          //   left: 70,
          //   child: Container(
          //     child: Lottie.asset('animations/confirmation-tick.json',
          //         height: 50, repeat: true),
          //   ),
          // ),
        ],
      ),
    );
  }
}
