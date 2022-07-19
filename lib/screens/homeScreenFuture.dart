import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenFuture extends StatefulWidget {
  const HomeScreenFuture({Key? key}) : super(key: key);

  @override
  State<HomeScreenFuture> createState() => _HomeScreenFutureState();
}

class _HomeScreenFutureState extends State<HomeScreenFuture> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 16.0);

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: FutureBuilder(
          future: getNumber(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  if (snapshot.connectionState == ConnectionState.waiting) ...[
                    SizedBox(height: 16.0),
                    CircularProgressIndicator()
                  ],
                  Expanded(
                    flex: 1,
                    child: Column(
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
                  ),
                ],
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
          }),
    ));
  }

  Future<int> getNumber() async {
    await Future.delayed(const Duration(seconds: 2));

    final random = Random();

    return random.nextInt(100);
  }
}
