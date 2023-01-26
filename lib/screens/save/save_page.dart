import 'package:flutter/material.dart';
import 'package:aplikasipertama/themes.dart';

class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Save Page",
        style: semiBoldText20,
      )),
    );
  }
}
