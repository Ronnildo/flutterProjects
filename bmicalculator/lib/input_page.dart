import 'package:bmicalculator/calcula_resultado.dart';
import 'package:bmicalculator/resultado.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final Color _corPadrao = const Color(0xFF1D1E30);
  final Color _corSecundaria = const Color(0xFF111328);
  bool _estado = true;

  int _weight = 59;
  int _age = 22;
  double _height = 0;

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

  void alterarCor(String sex) {
    switch (sex) {
      case 'MALE':
        setState(() {
          _estado = false;
        });
        break;
      case 'FEMALE':
        setState(() {
          _estado = true;
        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: const Color(0xFF0A0E21),
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => alterarCor('MALE'),
                    child: CardApp(
                      cor: _estado ? _corPadrao : _corSecundaria,
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
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => alterarCor('FEMALE'),
                    child: CardApp(
                      cor: _estado ? _corSecundaria : _corPadrao,
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
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_height.toInt()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 80,
                        ),
                      ),
                      const Text(
                        'cm',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  Slider(
                    min: 0.0,
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
                    cor: _corPadrao,
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
                              child: const ButtonApp(icon: Icons.add),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () => decrement('peso'),
                              child: const ButtonApp(icon: Icons.remove),
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
                    cor: _corPadrao,
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
                              child: const ButtonApp(icon: Icons.add),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () => decrement('idade'),
                              child: const ButtonApp(icon: Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
          onTap: () {
            CalculatorBrain calc = CalculatorBrain(_height.toInt(), _weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                        interpretation: calc.getInterpretation(),
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult())));
          },
          child: const BottomAppBart()),
    );
  }
}

class CardApp extends StatelessWidget {
  final Color cor;
  final Widget cont;
  const CardApp({Key? key, required this.cor, required this.cont})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 215,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cont,
    );
  }
}

class SliderCard extends StatelessWidget {
  const SliderCard({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E30),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      height: 200,
      child: widget,
    );
  }
}

class ButtonApp extends StatelessWidget {
  final IconData icon;
  const ButtonApp({Key? key, required this.icon}) : super(key: key);

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

class BottomAppBart extends StatefulWidget {
  const BottomAppBart({Key? key}) : super(key: key);

  @override
  State<BottomAppBart> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 80,
      color: const Color(0xFFEB1555),
      child: const Center(
        child: Text(
          'CALCULATE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
