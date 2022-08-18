import 'package:flutter/material.dart';
import 'package:path_tracking/src/components/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();
  late Future<String> _username;
  late List<String> _paths;

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: customAppBar(),
        body: ListView(padding: const EdgeInsets.all(50), children: [
          Text('Welcome $_username, please make your selection', textAlign: TextAlign.center),
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
                        return 'Please make a selection';
                      }
                      return null;
                    },
                    onChanged: (String val) {
                      setState(() {
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
                          _savePaths();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Your paths were saved!'))
                          );
                          Navigator.pushNamed(context, '/');
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

  Future<void> _savePaths() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.setStringList('paths', _paths);
    });
  }
}
