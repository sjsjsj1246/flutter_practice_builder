import 'package:flutter/material.dart';
import 'package:flutter_practice_builder/screens/homeScreenFuture.dart';
import 'package:flutter_practice_builder/screens/homeScreenStream.dart';

void main() {
  runApp(const MaterialApp(
    home: SafeArea(child: HomeScreenStream()),
  ));
}
