import 'package:flutter/material.dart';

class ImplicitAnimation extends StatelessWidget {
  const ImplicitAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width / 3;

    return SizedBox(
      width: double.infinity,
      child: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInBack,
                width: _width,
                child: Image.asset("assets/msi.jpg"),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_width == MediaQuery.of(context).size.width / 3)
                        _width = MediaQuery.of(context).size.width;
                      else
                        _width = MediaQuery.of(context).size.width / 3;
                    });
                  },
                  child: Text("click me"))
            ],
          );
        },
      ),
    );
  }
}
