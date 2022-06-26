import 'package:flutter/material.dart';

class CardApp extends StatelessWidget {
  final void Function() onTap;
  final Color cor;
  final Widget cont;
  const CardApp(
      {Key? key, required this.cor, required this.cont, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 215,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cont,
      ),
    );
  }
}
