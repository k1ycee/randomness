import 'package:flutter/material.dart';
import 'dart:math' as math;

class Paint2 extends StatefulWidget {
  @override
  _Paint2State createState() => _Paint2State();
}

class _Paint2State extends State<Paint2> with SingleTickerProviderStateMixin {
  var _sides = 3.0;
  var _radius = 100.0;
  var _radians = 1.0;

  Animation<double> animation;
  AnimationController controller;

  Tween<double> _rotation = Tween(begin: -math.pi, end: math.pi);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    animation = _rotation.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.stop();
        }
      });
      // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){setState(() {
                  controller.forward();
                });},
                onDoubleTap: (){setState(() {
                  controller.stop();
                });},
                child: CustomPaint(
                  child: Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,),
                  painter: ZPaint2(_sides, _radius, animation.value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Sides'),
            ),
            Slider(
              onChanged: (value) {
                setState(() {
                  _sides = value;
                });
              },
              value: _sides,
              min: 3.0,
              max: 20.0,
              divisions: 17,
              label: _sides.toInt().toString(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Size'),
            ),
            Slider(
              onChanged: (value) {
                setState(() {
                  _radius = value;
                });
              },
              value: _radius,
              min: 10.0,
              max: MediaQuery.of(context).size.width / 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Rotation'),
            ),
            Slider(
              onChanged: (value) {
                setState(() {
                  _radians = value;
                });
              },
              value: _radians,
              min: 0.0,
              max: math.pi,
            ),
          ],
        ),
      ),
    );
  }
}

class ZPaint2 extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;

  ZPaint2(this.sides, this.radius, this.radians);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    var path = Path();
    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 3);
    Offset starting =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(starting.dx + center.dx, starting.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;

      path.lineTo(x, y);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
