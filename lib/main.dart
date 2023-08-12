import 'package:flutter/material.dart';
import 'package:pixie_delights/coffee_concept/main_coffee_concept_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     home: MainCoffeeConceptApp(),
    );
  }
}