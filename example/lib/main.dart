import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:notification/notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: ${Platform.localeName}\n'),
        ),
        floatingActionButton: Padding(padding: EdgeInsets.all(15),
        child: Row(
          children: [
            FloatingActionButton.small(onPressed: (){
              notification.show(title: "Sample title", message: "Sample message", payload: {
                "content" : "Content message"
              });
            }, child: const Icon(Icons.notifications))
          ],
        )),
      ),
    );
  }
}
