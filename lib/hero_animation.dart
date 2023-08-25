import 'package:flutter/material.dart';
import 'package:untitled/static%20data/people_info.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("people"),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final Person person = people[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(person: person)));
            },
            leading: Hero(
              tag: person.name,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  person.emoji,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
            title: Text(person.name),
            subtitle: Text("${person.age} years old"),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Person person;

  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              flightShuttleBuilder: (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                switch (flightDirection) {
                  case HeroFlightDirection.push:
                    return Material(
                      color: Colors.transparent,
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(
                            begin: 0.0,
                            end: 1.0,
                          ).chain(
                            CurveTween(
                              curve: Curves.bounceIn,
                            ),
                          ),
                        ),
                        child: toHeroContext.widget,
                      ),
                    );
                  case HeroFlightDirection.pop:
                    return Material(
                      color: Colors.transparent,
                      child: fromHeroContext.widget,
                    );
                }
              },
              tag: person.name,
              child: Text(
                person.emoji,
                style: const TextStyle(
                  fontSize: 100,
                ),
              ),
            ),
            Text(person.name),
            Text("${person.age} years old"),
          ],
        ),
      ),
    );
  }
}
