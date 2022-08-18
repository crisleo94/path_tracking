import 'package:flutter/material.dart';
import 'package:path_tracking/src/components/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();
  late String _username;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: customAppBar(),
        body: ListView(padding: const EdgeInsets.all(50), children: [
          const Text('Keep track of your learning!', textAlign: TextAlign.center),
          const SizedBox(
            height: 100,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an username';
                        }
                        return null;
                    },
                    onChanged: (String val) {
                      setState(() {
                        _username = val;
                      });
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tell me your name',
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Colors.blue),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(width: 1, color: Colors.black38)),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(left: 30, right: 30)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono')),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _saveUsername();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Username was saved!'))
                          );
                          Navigator.pushNamed(context, '/select');
                        }
                      },
                      child: const Text(
                        'ENTER',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ))
        ]),
      ),
    );
  }

  Future<void> _saveUsername() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.setString('username', _username);
    });
  }
}
