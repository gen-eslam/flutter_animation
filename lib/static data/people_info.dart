import 'package:flutter/material.dart';

/// hero animation

@immutable
class Person {
  final String name, emoji;
  final int age;

  const Person({required this.name, required this.age, required this.emoji});
}

const List<Person> people = [
  Person(name: "fares", age: 21, emoji: "🧔"),
  Person(name: "eslam", age: 21, emoji: "🧔"),
  Person(name: "gen", age: 21, emoji: "🧔"),
];
