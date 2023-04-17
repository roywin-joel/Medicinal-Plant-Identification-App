import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaf_snap/constants.dart';
import 'package:leaf_snap/models/image_picker_controller.dart';
import 'package:leaf_snap/ui/screens/scan_anim.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  ImagePickerController controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Scan",
            style: TextStyle(
                color: Constants.blackColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              // Do something
              await controller.captureImage();
              FileImage f = FileImage(File(controller.imagePath.toString()));
              File pred = File(controller.imagePath.toString());
              if (controller.imagePath.toString() != "") {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    // return ScannerAnimation(
                    //   f: f,
                    // );
                    return ScannerAnim(
                      f: f,
                      pred: pred,
                    );
                  },
                ));
              } else {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.camera),
            label: Text('Take Photo'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Constants.primaryColor),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              // Do something
              await controller.getImage();
              FileImage f = FileImage(File(controller.imagePath.toString()));
              File pred = File(controller.imagePath.toString());
              if (controller.imagePath.toString() != "") {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    // return ScannerAnimation(
                    //   f: f,
                    // );
                    return ScannerAnim(
                      f: f,
                      pred: pred,
                    );
                  },
                ));
              } else {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.upload),
            label: Text('Upload Photo'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Constants.primaryColor),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
