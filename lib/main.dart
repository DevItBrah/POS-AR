import 'dart:io';

import 'package:pos_ar/view/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:pos_ar/view/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: LoginScreen(),
    );
  }
}
