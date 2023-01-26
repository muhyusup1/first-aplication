import 'package:flutter/material.dart';
import 'package:aplikasipertama/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Cart Page",
        style: semiBoldText20,
      )),
    );
  }
}
