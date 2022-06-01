import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int dadoUm = 1;
  int dadoDois = 1;

  void diceSort() {
    Random num = Random();

    setState(() {
      dadoUm = num.nextInt(6) + 1;
      dadoDois = num.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dicee',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              DiceButton(face: dadoUm, onTap: diceSort),
              DiceButton(face: dadoDois, onTap: diceSort)
            ],
          ),
        ],
      ),
      backgroundColor: Colors.red,
    );
  }
}

class DiceButton extends StatelessWidget {
  const DiceButton({Key? key, required this.face, required this.onTap})
      : super(key: key);
  final int face;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          child: Image(
            image: AssetImage('images/dice$face.png'),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
