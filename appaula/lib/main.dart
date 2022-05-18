import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Aula',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'App Aula'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Hello World',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontFamily: 'Permanent Marker',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    '../assets/images/chorrin.jpg',
                    scale: 3.0,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 40,
                  alignment: Alignment.center,
                  color: Colors.lightBlue.shade300,
                  child: const Text('O',
                      style: TextStyle(
                        fontFamily: 'Permanent Marker',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),
                ),
                Container(
                  width: 100,
                  height: 40,
                  color: Colors.lightBlue.shade300,
                  alignment: Alignment.center,
                  child: const Text(
                    'Chorrin',
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  color: Colors.lightBlue.shade300,
                  alignment: Alignment.center,
                  child: const Text('Au!',
                      style: TextStyle(
                        fontFamily: 'Permanent Marker',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 40,
                  color: Colors.lightBlue.shade300,
                  alignment: Alignment.center,
                  child: const Text(
                    'Snack',
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  color: Colors.lightBlue.shade300,
                  alignment: Alignment.center,
                  child: const Text(
                    'Dog',
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  color: Colors.lightBlue.shade300,
                  alignment: Alignment.center,
                  child: const Text(
                    'Toast',
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
