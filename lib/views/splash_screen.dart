import 'dart:async';

import 'package:flutter/material.dart';
import 'package:victory/constants/routes.dart';
import 'package:victory/utils/navigator.dart';
import 'package:victory/views/sign_in.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), route);
    super.initState();
  }

  route(){
    Navigator.pushNamed(context, Login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:50.0),
            child: Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
