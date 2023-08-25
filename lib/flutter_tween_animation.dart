import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlutterTweenAnimation extends StatefulWidget {
  const FlutterTweenAnimation({super.key});

  @override
  State<FlutterTweenAnimation> createState() => _FlutterTweenAnimationState();
}

class _FlutterTweenAnimationState extends State<FlutterTweenAnimation> {
  Color _color = getRandomColor();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: CircleClipper(),
                  child: TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 750),
                    onEnd: () {
                      setState(() {
                        _color = getRandomColor();
                      });
                    },
                    tween: ColorTween(begin: getRandomColor(), end: _color),
                    builder: (context, Color? color, child) {
                      return ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(color!, BlendMode.srcATop),
                        child: child!,
                      );
                    },
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  "Hello",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color getRandomColor() => Color(0xFF000000 + math.Random().nextInt(0x00FFFFFF));

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);
    path.addOval(rect);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
