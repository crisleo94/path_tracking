import 'package:flutter/material.dart';
import 'package:path_tracking/src/pages/details_page.dart';
import 'package:path_tracking/src/pages/home_page.dart';
import 'package:path_tracking/src/pages/list_page.dart';
import 'package:path_tracking/src/pages/login_page.dart';
import 'package:path_tracking/src/pages/select_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    '/login': (BuildContext context) => LoginPage(),
    '/select': (BuildContext context) => SelectPage(),
    '/list': (BuildContext context) => ListPage(),
    '/details': (BuildContext context) => DetailsPage(),
  };
}