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

    return Scaffold(
        body: FutureBuilder(
            future: getNumber(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) ...[
                        SizedBox(width: 10.0),
                        CircularProgressIndicator()
                      ],
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("futureBuilder",
                              style: textStyle.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 20.0)),
                          Text("ConState : ${snapshot.connectionState}",
                              style: textStyle),
                          Text("Data : ${snapshot.data}", style: textStyle),
                          Text("Error : ${snapshot.error}", style: textStyle),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {});
                              },
                              child: Text("Refresh")),
                        ],
                      ),
                    ],
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Icon(Icons.error),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  Future<int> getNumber() async {
    await Future.delayed(const Duration(seconds: 2));

    final random = Random();

    return random.nextInt(100);
  }
}
