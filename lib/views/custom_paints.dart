import 'package:flutter/material.dart';
import 'package:victory/views/paint_1.dart';
import 'package:victory/views/paint_2.dart';

class Paints extends StatelessWidget {
  final List<Widget> customs = [Paint1(), Paint2()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: PageView.builder(
          itemCount: customs.length,
          itemBuilder: (context, index) => customs[index]),
    );
  }
}



