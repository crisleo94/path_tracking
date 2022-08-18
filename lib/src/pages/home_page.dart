import 'package:flutter/material.dart';
import 'package:path_tracking/src/components/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _username;

  @override
  void initState() {
    super.initState();
    setState(() {
      _username = _prefs.then((SharedPreferences prefs) {
        return prefs.getString('username') ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<String>(
          future: _username,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else {
                  return Text('The data is ${snapshot.data}');
                }
            }
          },
        ),
      ),
    );
  }
}

