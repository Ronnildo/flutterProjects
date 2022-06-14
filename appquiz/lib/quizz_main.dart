import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  // widget
  runApp(const MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  const MyQuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Quiz(),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _MyAppState();
}

class _MyAppState extends State<Quiz> {
  List<Pergunta> perguntas = [
    Pergunta("Flutter é legal?", true),
    Pergunta("Java é legal?", false),
    Pergunta("C++ é legal?", false),
    Pergunta("Python é legal?", true),
    Pergunta("Elixir é legal?", true),
  ];
  List<Icon> resultado = [];
  int perguntaAtual = 0;

  int incrementarPergunta() {
    if (perguntaAtual >= perguntas.length - 1) {
      resultado.clear();
      return 0;
    } else {
      return perguntaAtual + 1;
    }
  }

  void verificaResposta(bool botaoApertado) {
    if (perguntas[perguntaAtual].resposta == botaoApertado) {
      setState(() {
        perguntaAtual = incrementarPergunta();
        resultado.add(
          const Icon(Icons.check, color: Colors.green),
        );
      });
    } else {
      setState(() {
        perguntaAtual = incrementarPergunta();
        resultado.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 9,
            child: Center(
              child: Text(
                perguntas[perguntaAtual].texto,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          BotaoResposta(
            title: 'Verdade',
            cor: Colors.green,
            onTap: () => verificaResposta(true),
          ),
          BotaoResposta(
            title: 'Mentira',
            cor: Colors.red,
            onTap: () => verificaResposta(false),
          ),
          Row(
            children: resultado,
          )
        ],
      ),
    );
  }
}

class BotaoResposta extends StatelessWidget {
  final String title;
  final Color cor;
  final void Function() onTap;

  const BotaoResposta({
    Key? key,
    required this.title,
    required this.cor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 8.0,
        ),
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            title,
            style: const TextStyle(fontSize: 18.0),
          ),
          style: ElevatedButton.styleFrom(
            primary: cor,
            padding: const EdgeInsets.all(30.0),
          ),
        ),
      ),
    );
  }
}

class Pergunta {
  String texto;
  bool resposta;
  Pergunta(this.texto, this.resposta);
}
