import 'package:flutter/material.dart';
import 'package:subscription/pages/subscription_plan_page.dart';
import 'package:subscription/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SubscriptionPlanPage(),
        ),
      ),
    );
  }
}