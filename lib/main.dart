import 'package:flutter/material.dart';
import 'package:talent_project/screen/cooroporate_signup.dart';
import 'package:talent_project/screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const SignupScreen(),
    );
  }
}
