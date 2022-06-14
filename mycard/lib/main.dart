import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My card',
      home: Mycard(),
    ),
  );
}

class Mycard extends StatefulWidget {
  const Mycard({Key? key}) : super(key: key);

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60.0,
            backgroundImage: NetworkImage(
                'https://pixabay.com/pt/vectors/retrato-est%c3%a9tico-homem-senhor-2899779/',
                scale: 0),
          ),
          const Text(
            "Ronnildo Rodrigues",
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            "FLUTTER DEVELOPER",
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const Divider(
            indent: 100,
            endIndent: 100,
            thickness: 0.1,
            color: Colors.grey,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: const EdgeInsets.all(10),
            height: 50,
            color: Colors.white,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.call,
                  color: Colors.teal,
                  size: 30,
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  '+55 86 99689-0987',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            height: 50,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.email,
                  color: Colors.teal,
                  size: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'ronildosp03@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
