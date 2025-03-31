import 'package:flutter/material.dart';
import 'package:magic_8_ball/commons/common_text.dart';
import 'package:magic_8_ball/pages/shake_screen.dart';
import 'package:magic_8_ball/resources/colors.dart';
import 'package:magic_8_ball/widgets/ball_maker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey900,
        centerTitle: true,
        title: CommonText(
          data: "Magic 8 Ball",
          fontSize: 24,
          fontColor: Colors.white,
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: ShakeScreen(),
        ),
      ),
    );
  }
}
