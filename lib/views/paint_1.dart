import 'package:flutter/material.dart';
import 'dart:ui';

class Paint1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: CustomPaint(
        painter: ZPaint1(),
        child: Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,),
      ),
    );
  }
}

class ZPaint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint()
    //   ..color = Colors.blue[300]
    //   ..strokeWidth = 2
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round;

    //   // Offset starting = Offset(size.width / 2, 0);
    //   // Offset ending  = Offset(size.width / 2,size.height);

    //   var path = Path();
    //   path.moveTo(size.width / 2, 0);
    //   path.lineTo(size.width / 2,size.height);

    //   canvas.drawPath(path,paint);

    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    var path = Path();

    path.addOval(Rect.fromCircle(center: center, radius: 150));

    canvas.drawCircle(center, 150, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}