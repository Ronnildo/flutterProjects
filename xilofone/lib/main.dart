import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final player = AudioPlayer();

  Future<void> audio(AssetSource source) async {
    var play = await player.setSource(
      source,
    );
    return await player.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TeclaXilofone(
              cor: Colors.red,
              onTap: () => audio(
                AssetSource('audio/note1.wav'),
              ),
            ),
            TeclaXilofone(
              cor: Colors.orange,
              onTap: () => audio(
                AssetSource('audio/note2.wav'),
              ),
            ),
            TeclaXilofone(
              cor: Colors.yellow,
              onTap: () => audio(
                AssetSource('audio/note3.wav'),
              ),
            ),
            TeclaXilofone(
              cor: Colors.green,
              onTap: () => audio(
                AssetSource('audio/note4.wav'),
              ),
            ),
            TeclaXilofone(
              cor: Colors.teal,
              onTap: () => audio(
                AssetSource('audio/note5.wav'),
              ),
            ),
            TeclaXilofone(
              cor: Colors.blue,
              onTap: () => audio(
                AssetSource('audio/note6.wav'),
              ),
            ),
            TeclaXilofone(
              cor: Colors.purple,
              onTap: () => audio(
                AssetSource('audio/note7.wav'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TeclaXilofone extends StatelessWidget {
  final Color cor;
  final void Function() onTap;
  const TeclaXilofone({
    Key? key,
    required this.cor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white,
        child: Container(
          color: cor,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
