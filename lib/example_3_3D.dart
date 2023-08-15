import 'dart:math';
import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ThreeDimensionAnimation extends StatefulWidget {
  const ThreeDimensionAnimation({super.key});

  @override
  State<ThreeDimensionAnimation> createState() =>
      _ThreeDimensionAnimatrionState();
}

class _ThreeDimensionAnimatrionState extends State<ThreeDimensionAnimation>
    with TickerProviderStateMixin {
  final double widthAndHeight = 100, blurRadius = 10, spreadRadius = 3;
  final Offset shadowOffset = const Offset(0, 0);
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();
    _xController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _yController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _zController =
        AnimationController(vsync: this, duration: const Duration(seconds: 40));
    _animation = Tween<double>(begin: 0, end: 2 * pi);
  }

  @override
  void dispose() {
    super.dispose();
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();
    _yController
      ..reset()
      ..repeat();
    _zController
      ..reset()
      ..repeat();
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation:
              Listenable.merge([_xController, _yController, _zController]),
          builder: (context, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateX(_animation.evaluate(_xController))
              ..rotateY(_animation.evaluate(_yController))
              ..rotateZ(_animation.evaluate(_zController)),
            child: Stack(
              children: [
                //back
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(Vector3(0, 0, -widthAndHeight)),
                  child: Container(
                    width: widthAndHeight,
                    height: widthAndHeight,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      boxShadow: [
                        BoxShadow(
                            offset: shadowOffset,
                            color: Colors.purple,
                            blurRadius: blurRadius,
                            spreadRadius: spreadRadius),
                      ],
                    ),
                  ),
                ),
                //left
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()..rotateY(pi / 2),
                  child: Container(
                    width: widthAndHeight,
                    height: widthAndHeight,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                            offset: shadowOffset,
                            color: Colors.red,
                            blurRadius: blurRadius,
                            spreadRadius: spreadRadius),
                      ],
                    ),
                  ),
                ),
                //right
                Transform(
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()..rotateY(-pi / 2),
                  child: Container(
                    width: widthAndHeight,
                    height: widthAndHeight,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                            offset: shadowOffset,
                            color: Colors.blue,
                            blurRadius: blurRadius,
                            spreadRadius: spreadRadius),
                      ],
                    ),
                  ),
                ),

                //front
                Container(
                  width: widthAndHeight,
                  height: widthAndHeight,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                          offset: shadowOffset,
                          color: Colors.green,
                          blurRadius: blurRadius,
                          spreadRadius: spreadRadius),
                    ],
                  ),
                ),
                //top
                Transform(
                  alignment: Alignment.topCenter,
                  transform: Matrix4.identity()..rotateX(-pi / 2),
                  child: Container(
                    width: widthAndHeight,
                    height: widthAndHeight,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      boxShadow: [
                        BoxShadow(
                            offset: shadowOffset,
                            color: Colors.deepOrangeAccent,
                            blurRadius: blurRadius,
                            spreadRadius: spreadRadius),
                      ],
                    ),
                  ),
                ),
                //bottom
                Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()..rotateX(pi / 2),
                  child: Container(
                    width: widthAndHeight,
                    height: widthAndHeight,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(
                            offset: shadowOffset,
                            color: Colors.orange,
                            blurRadius: blurRadius,
                            spreadRadius: spreadRadius),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
