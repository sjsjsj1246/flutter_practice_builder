import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 16.0);

    return Scaffold(body: FutureBuilder(builder: (context, snapshot) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("futerBuilder",
                style: textStyle.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 20.0)),
            Text("ConState : ${snapshot.connectionState}",
                style: textStyle.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 20.0)),
            Text("Data : ${snapshot.data}",
                style: textStyle.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 20.0)),
            Text("Error : ${snapshot.error}",
                style: textStyle.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 20.0)),
          ],
        ),
      );
    }));
  }

  Future<int> getNumber() async {
    await Future.delayed(const Duration(seconds: 3));

    final random = Random();

    return random.nextInt(100);
  }
}
