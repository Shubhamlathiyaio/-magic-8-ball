import 'package:flutter/material.dart';
import 'package:magic_8_ball/resources/assets_paths,.dart';

class BallMaker extends StatelessWidget {
  const BallMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center,
      children: [
      Image.asset(blankBall),
      Image.asset(noBall),
    ],);
  }
}