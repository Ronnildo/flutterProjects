import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AppVolei(),
      theme: ThemeData(fontFamily: 'Concert One'),
    ),
  );
}

class AppVolei extends StatelessWidget {
  const AppVolei({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF00ADC3),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF2B4A8E),
        ),
        body: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 60),
              child: InitialInfo(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 70),
              child: ContainerCentral(),
            ),
            ButtonVolley(),
          ],
        ),
      ),
    );
  }
}

class InitialInfo extends StatelessWidget {
  const InitialInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/ball.png'),
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                'Volley',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  //fontFamily: 'Concert One',
                ),
              ),
            ),
            Text(
              'do fim de semana',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Concert One',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonVolley extends StatelessWidget {
  const ButtonVolley({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Jogo Casado',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text('Iniciar'),
          ),
          style: ElevatedButton.styleFrom(
              primary: const Color(0xFF2B4A8E),
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
              textStyle: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Concert One',
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              side: const BorderSide(
                color: Colors.white,
                width: 3,
              )),
        ),
      ],
    );
  }
}

class ContainerCentral extends StatelessWidget {
  const ContainerCentral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 3,
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              margin: const EdgeInsets.only(right: 30),
              height: 200,
              width: 80,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: const Color(0xFF73CFD5),
                  border: Border.all(color: Colors.white, width: 3)),
              child: const RotatedBox(
                child: const Text(
                  'TIMES',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
                quarterTurns: 3,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              InfosTimes(nameTime: 'Sicranos', quantd: 3),
              InfosTimes(nameTime: 'Autoconvidados', quantd: 3),
              InfosTimes(nameTime: 'Ziraldos', quantd: 4),
              InfosTimes(nameTime: 'Sparrings', quantd: 5),
            ],
          ),
        ],
      ),
    );
  }
}

class InfosTimes extends StatelessWidget {
  final String nameTime;
  final int quantd;
  const InfosTimes({Key? key, required this.nameTime, required this.quantd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
            nameTime,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Color(0xFFEDC735),
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 2),
            child: Text(
              '$quantd',
              style: const TextStyle(
                color: Color(0xFF2B4A8E),
                fontWeight: FontWeight.normal,
                fontSize: 60,
              ),
            ),
          ),
          const RotatedBox(
            quarterTurns: 3,
            child: Text(
              'jogadores',
              style: TextStyle(
                color: Color(0xFF2B4A8E),
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
