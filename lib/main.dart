import 'package:flutter/material.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromARGB(255, 18, 94, 20),
        //colorSchemeSeed: Color.fromARGB(34, ,139 34, 100),
        //
      ),
    );
  }
}
