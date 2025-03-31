import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:magic_8_ball/resources/assets_paths,.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ShakeScreen extends StatefulWidget {
  @override
  _ShakeScreenState createState() => _ShakeScreenState();
}

class _ShakeScreenState extends State<ShakeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  final player = AudioPlayer(); // 🎵 Audio Player instance
  String imagePath = blankBall;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 30), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 40, end: -30), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -30, end: 25), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 25, end: -25), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -25, end: 15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 15, end: 0), weight: 1),
    ]).animate(_controller);

    // Listen for device shakes
    accelerometerEvents.listen((event) {
      double acceleration = event.x.abs() + event.y.abs() + event.z.abs();
      if (acceleration > 50) {
        // Adjust sensitivity as needed
        shakeBall();
      }
    });
  }

  void shakeBall() async {
    _controller.duration = Duration(milliseconds: 100);
    _controller.repeat(reverse: true);

    try {
      await player
          .play(AssetSource(shakingNoice)); // ✅ No `assets/` prefix needed!
    } catch (e) {
      print("Error loading sound: $e"); // 🛠 Debugging info
    }

    Future.delayed(Duration(milliseconds: 900), () {
      _controller.stop();
      _controller.animateTo(0,
          duration:
              Duration(milliseconds: 100)); // 🔄 Smoothly return to center
      imagePath = noBall;
      setState(() {});
      player.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_shakeAnimation.value, 0),
              child: child,
            );
          },
          child:
              GestureDetector(onTap: shakeBall, child: Image.asset(imagePath)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
