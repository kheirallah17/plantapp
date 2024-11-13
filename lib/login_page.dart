import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';
class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login page"),
        backgroundColor: Constants.primagyColor,
      ),
    );
  }
}