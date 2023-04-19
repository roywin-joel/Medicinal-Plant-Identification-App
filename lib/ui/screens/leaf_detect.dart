import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:leaf_snap/classifier/classifier.dart';
import 'package:leaf_snap/constants.dart';
import 'package:leaf_snap/styles.dart';
import 'package:leaf_snap/ui/root_page.dart';
import 'package:leaf_snap/ui/screens/home_page.dart';
import 'package:leaf_snap/ui/screens/scan_page.dart';

const _labelsFileName = 'assets/model.txt';
const _modelFileName = 'model.tflite';

class LeafDetection extends StatefulWidget {
  final File f;
  const LeafDetection({super.key, required this.f});

  @override
  State<LeafDetection> createState() => _LeafDetectionState();
}

class _LeafDetectionState extends State<LeafDetection> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
