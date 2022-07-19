import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenStream extends StatefulWidget {
  const HomeScreenStream({Key? key}) : super(key: key);

  @override
  State<HomeScreenStream> createState() => _HomeScreenStreamState();
}

class _HomeScreenStreamState extends State<HomeScreenStream> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 16.0);

    return Scaffold(
        body: StreamBuilder<int>(
            stream: streamNumbers(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) ...[
                        Positioned(
                            top: 10.0,
                            width: MediaQuery.of(context).size.width,
                            child: Center(child: CircularProgressIndicator()))
                      ],
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("streamBuilder",
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

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(const Duration(seconds: 1));

      yield i;
    }
  }
}
