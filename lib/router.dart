import 'package:flutter/material.dart';
import 'package:victory/constants/routes.dart';
import 'package:victory/views/custom_paints.dart';
import 'package:victory/views/sign_in.dart';
import 'package:victory/views/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Login:
      return _getRoute(
        routeName: settings.name,
        viewToShow: LoginScreen(),
      );
    case Paint:
      return _getRoute(
        routeName: settings.name,
        viewToShow: Paints(),
      );
    case Splashs:
      return _getRoute(
        routeName: settings.name,
        viewToShow: Splash(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Non-Existent View',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ),
      );
  }
}

PageRoute _getRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
    builder: (_) => viewToShow,
    settings: RouteSettings(name: routeName),
  );
}
