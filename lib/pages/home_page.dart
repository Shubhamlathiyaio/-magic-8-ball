import 'package:flutter/material.dart';
import 'package:magic_8_ball/commons/common_text.dart';
import 'package:magic_8_ball/pages/shake_screen.dart';
import 'package:magic_8_ball/resources/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    double minSide = width < height ? width : height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        centerTitle: true,
        title: CommonText(
          data: "Magic 8 Ball",
          fontSize: 24,
          fontColor: Colors.white,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ShakeScreen(),
        ),
      ),
    );
  }
}
