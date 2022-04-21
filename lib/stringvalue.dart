import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class share extends StatefulWidget {
  const share({Key? key}) : super(key: key);

  @override
  State<share> createState() => _shareState();
}

class _shareState extends State<share> {
  String? c;
  String d = "";
  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get();
  }

  Get() async {
    prefs = await SharedPreferences.getInstance();

    c = prefs!.getString("get") ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "name", border: OutlineInputBorder()),
              controller: a,
            ),
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    c = a.text;
                    prefs!.setString("get", c!);
                  });
                },
                child: Text("Get Data")),
          ),
          Container(
              margin: EdgeInsets.all(30),
              child: Text("${d}")),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    d = prefs!.getString("get") ?? "";
                  });
                },
                child: Text("Set Data")),
          ),
        ],
      )),
    );
  }

  TextEditingController a = TextEditingController();
}
