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

enum _ResultStatus {
  notStarted,
  notFound,
  found,
}

class _LeafDetectionState extends State<LeafDetection> {
  // Result
  _ResultStatus _resultStatus = _ResultStatus.notStarted;
  String _plantLabel = ''; // Name of Error Message
  double _accuracy = 0.0;
  late Classifier _classifier;

  @override
  void initState() {
    super.initState();
    _loadClassifier();
  }

  Future<void> _loadClassifier() async {
    // debugPrint(
    //   'Start loading of Classifier with '
    //   'labels at $_labelsFileName, '
    //   'model at $_modelFileName',
    // );

    final classifier = await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _modelFileName,
    );
    _classifier = classifier!;
  }

  void _analyzeImage(File image1) {
    final imageInput = img.decodeImage(image1.readAsBytesSync())!;
    //Image f1 = Image(image: image1);
    final resultCategory = _classifier.predict(imageInput);

    final result = resultCategory.score >= 0.5
        ? _ResultStatus.found
        : _ResultStatus.notFound;
    final plantLabel = resultCategory.label;
    final accuracy = resultCategory.score;

    setState(() {
      _resultStatus = result;
      _plantLabel = plantLabel;
      _accuracy = accuracy;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      Timer(Duration(seconds: 1), () {
        _analyzeImage(widget.f);
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                // Image(
                //   image: FileImage(File(widget.f.toString())),
                //   //height: MediaQuery.of(context).size.height / 2.5,
                //   width: double.maxFinite,
                //   fit: BoxFit.cover,
                // ),
                Image.file(
                  widget.f,
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Result',
                    style: TextStyle(fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //navigate details
                  },
                  child: _buildResultView(),
                ),
              ],
            ),
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return RootPage();
                  // }));
                  Navigator.pop(context);
                  // while (Navigator.canPop(context)) {
                  //   // Navigator.canPop return true if can pop
                  //   Navigator.pop(context);
                  // }
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildResultView() {
    var title = '';
    if (_resultStatus == _ResultStatus.notFound) {
      title = 'Fail to recognise';
    } else if (_resultStatus == _ResultStatus.found) {
      title = _plantLabel;
    } else {
      title = '';
    }

    //
    var accuracyLabel = '';
    if (_resultStatus == _ResultStatus.found) {
      accuracyLabel = 'Accuracy: ${(_accuracy * 100).toStringAsFixed(2)}%';
    }

    return Column(
      children: [
        Text(
          title,
          style: kResultTextStyle,
        ),
        const SizedBox(height: 10),
        Text(accuracyLabel, style: kResultRatingTextStyle)
      ],
    );
  }
}
