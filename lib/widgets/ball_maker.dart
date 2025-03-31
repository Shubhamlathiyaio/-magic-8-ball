import 'package:flutter/material.dart';
import 'package:magic_8_ball/resources/assets_paths,.dart';

class BallMaker extends StatelessWidget {
  String label;
  BallMaker({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(blankBall),
        Image.asset(label),
      ],
    );
  }
}
