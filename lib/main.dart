import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:magic_8_ball/pages/home_page.dart';
import 'package:magic_8_ball/pages/shake_screen.dart';
import 'package:magic_8_ball/resources/assets_paths,.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}

