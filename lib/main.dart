import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/home_screen.dart';
import 'package:flutter_challenge/services/api_service.dart';

void main() {
  ApiService().getBaseMovies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
