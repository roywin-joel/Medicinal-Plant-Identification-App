import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetectLeaf extends StatefulWidget {
  const DetectLeaf({super.key});

  @override
  State<DetectLeaf> createState() => _DetectLeafState();
}

class _DetectLeafState extends State<DetectLeaf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("hi"),
        ),
      ),
    );
  }
}
