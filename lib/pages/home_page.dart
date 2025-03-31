import 'package:flutter/material.dart';
import 'package:magic_8_ball/pages/commons/common_text.dart';

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
        centerTitle: true,
        title: CommonText(
          data: "Magic 8 Ball",
          fontColor: Colors.white,
        ),
      ),
    );
  }
}
