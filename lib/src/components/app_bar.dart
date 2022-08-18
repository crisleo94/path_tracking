import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar() {
  return AppBar(
    title: const Text('Path Tracking'),
    centerTitle: true,
    //automaticallyImplyLeading: false,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.w200,
      fontFamily: 'RobotoMono'
    ),
    backgroundColor: Colors.white,
    elevation: 10,
    shadowColor: Colors.black,
  );
}