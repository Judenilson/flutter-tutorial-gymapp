import 'package:flutter/material.dart';
import 'package:gym_app/screens/authenticate_screen.dart';
// import 'package:gym_app/screens/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthenticateScreen(),
    );
  }
}
