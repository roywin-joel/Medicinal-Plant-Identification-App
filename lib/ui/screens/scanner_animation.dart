import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaf_snap/models/image_picker_controller.dart';
import 'package:leaf_snap/ui/screens/detail_page.dart';
import 'package:leaf_snap/ui/screens/detected_leaf.dart';
import 'package:leaf_snap/ui/screens/widgets/scanner_widget.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/plants.dart';

class ScannerAnimation extends StatefulWidget {
  final FileImage f;
  const ScannerAnimation({super.key, required this.f});

  @override
  State<ScannerAnimation> createState() => _ScannerAnimationState();
}

class _ScannerAnimationState extends State<ScannerAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _animationStopped = false;
  String scanText = "Scan";
  bool scanning = false;
  List<Plant> _plantList = Plant.plantList;

  @override
  void initState() {
    _animationController = new AnimationController(
        duration: new Duration(seconds: 1), vsync: this);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      animateScanAnimation(false);
      Timer(Duration(seconds: 5), () {
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => DetectLeaf(),
        //   ),
        // );

        Navigator.pushReplacement(
            context,
            PageTransition(
                child: DetailPage(
                  plantId: _plantList[0].plantId,
                ),
                type: PageTransitionType.bottomToTop));
      });
    });
    return CupertinoPageScaffold(
      //navigationBar: CupertinoNavigationBar(middle: Text("Scanning Animation")),
      child: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: CupertinoColors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image(
                              width: 334,
                              //image: AssetImage('assets/images/nature-.png')),
                              image: widget.f),
                          //image: FileImage(File(widget.controller.imagePath.toString())),
                        ),
                      ),
                    ),
                    ImageScannerAnimation(
                      false,
                      334,
                      animation: _animationController as Animation<double>,
                    ),
                  ]),
                ])),
      ),
    );
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
