import 'package:flutter/material.dart';
import 'package:miraclevalidateflutter/FormValidation/MiracleFormValidation.dart';

import 'Screens/FormValidationScreen.dart';
import 'Validation/IN_NumberToWord.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormValidationScreen(),
    );
  }
}

