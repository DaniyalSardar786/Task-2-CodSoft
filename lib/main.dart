import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quotes/home_screen.dart';
import 'package:quotes/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share/share.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quote of the Day',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const SplashScreen(),
    );
  }
}

