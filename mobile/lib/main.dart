import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const HealBandhuApp());
}

class HealBandhuApp extends StatelessWidget {
  const HealBandhuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealBandhu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF168C82)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
