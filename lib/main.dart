import 'package:flutter/material.dart';
import 'package:path_tracking/src/routes/routes.dart';

void main() => runApp(PathTracking());

class PathTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path Tracking',
      initialRoute: '/login',
      routes: getRoutes(),
      theme: ThemeData(fontFamily: 'RobotoMono'),
    );
  }
}
