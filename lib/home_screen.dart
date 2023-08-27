import 'package:flutter/material.dart';

import 'examples/example_3_3D.dart';
import 'examples/flipped_circle.dart';
import 'examples/flipped_container.dart';
import 'examples/flutter_tween_animation.dart';
import 'examples/hero_animation.dart';
import 'examples/implicit_animation.dart';
import 'examples/polygons.dart';

List<Widget> bodyWidget = const [
  FlippedContainer(),
  FlippedCircle(),
  ThreeDimensionAnimation(),
  HeroAnimation(),
  ImplicitAnimation(),
  FlutterTweenAnimation(),
  Polygons(),
];
List<Tab> tab = [
  Tab(
    text: "FlippedContainer",
  ),
  Tab(
    text: "FlippedCircle",
  ),
  Tab(
    text: "ThreeDimensionAnimation",
  ),
  Tab(
    text: "HeroAnimation",
  ),
  Tab(
    text: "ImplicitAnimation",
  ),
  Tab(
    text: "FlutterTweenAnimation",
  ),
  Tab(
    text: "Polygons",
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: bodyWidget.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: tab,
            ),
          ),
          body: TabBarView(
            children: bodyWidget,
          ),
        ));
  }
}
