import 'package:flutter/material.dart';
import 'package:victory/constants/routes.dart';
import 'package:victory/router.dart' as route;
import 'package:victory/utils/navigator.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splashs,
      onGenerateRoute: route.generateRoute,
      navigatorKey: Navigation().navPersona,
    );
  }
}

