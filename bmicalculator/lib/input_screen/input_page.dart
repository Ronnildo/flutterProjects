import 'package:bmicalculator/calcula_resultado.dart';
import 'package:bmicalculator/resultado.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_padrao.dart';
import 'slider_card.dart';

const Color corPadrao = Color(0xFF1D1E30);
const Color corClique = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color _corM = corPadrao;
  Color _corF = corClique;
  bool _estado = true;

  int _weight = 59;
  int _age = 22;
  double _height = 100;

  void increment(String op) {
    setState(() {
      switch (op) {
        case 'peso':
          _weight += 1;
          break;
        case 'idade':
          _age += 1;
          break;
      }
    });
  }

  void decrement(String op) {
    setState(() {
      switch (op) {
        case 'peso':
          _weight -= 1;
          break;
        case 'idade':
          _age -= 1;
          break;
      }
    });
  }

  void alterarCor(bool sex) {
    setState(() {
      if (sex) {
        _corM = corClique;
        _corF = corPadrao;
      } else {
        _corF = corClique;
        _corM = corPadrao;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFF0A0E21),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: CardApp(
                    cor: _corM,
                    onTap: () => alterarCor(true),
                    cont: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CardApp(
                    cor: _corF,
                    onTap: () => alterarCor(false),
                    cont: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SliderCard(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${_height.ceil()}',
                          style: const TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: 'cm',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    min: 50.0,
                    max: 250.0,
                    value: _height,
                    activeColor: Colors.white,
                    inactiveColor: const Color(0xFF4C4F5E),
                    thumbColor: const Color(0xFFEB1555),
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                    autofocus: true,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CardApp(
                    onTap: () {},
                    cor: corPadrao,
                    cont: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '$_weight',
                          style: const TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => increment('peso'),
                              child: const ButtonInDec(icon: Icons.add),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () => decrement('peso'),
                              child: const ButtonInDec(icon: Icons.remove),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CardApp(
                    onTap: () {},
                    cor: corClique,
                    cont: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '$_age',
                          style: const TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => increment('idade'),
                              child: const ButtonInDec(icon: Icons.add),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () => decrement('idade'),
                              child: const ButtonInDec(icon: Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                CalculatorBrain calc =
                    CalculatorBrain(_height.toInt(), _weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                            interpretation: calc.getInterpretation(),
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult())));
              },
              child: Text(
                'Calcular',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFEB1555),
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonInDec extends StatelessWidget {
  final IconData icon;
  const ButtonInDec({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: 45,
        color: Colors.white,
      ),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF4C4F5E),
      ),
    );
  }
}
