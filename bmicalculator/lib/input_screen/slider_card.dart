import 'package:flutter/material.dart';

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
