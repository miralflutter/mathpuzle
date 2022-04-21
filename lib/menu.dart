

import 'dart:html';

import 'package:flutter/material.dart';

class menuu extends StatefulWidget {
  const menuu({Key? key}) : super(key: key);

  @override
  State<menuu> createState() => _menuuState();
}

class _menuuState extends State<menuu> {
  bool panipuri = false;
  bool vadapav = false;
  bool alupoori = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text("Pani puri - 10"),
              Checkbox(
                onChanged: (value) {
                  setState(() {
                    panipuri = value!;

                    getvalue(panipuri,10);

                  });
                },
                value: panipuri,
              ),
            ],
          ),  Row(
            children: [Text("vadapav - 10"),
              Checkbox(
                onChanged: (value) {
                  setState(() {
                    vadapav = value!;
                    getvalue(vadapav,10);
                  });
                },
                value: vadapav,
              ),
            ],
          ),  Row(
            children: [Text("alupoori - 20"),
              Checkbox(
                onChanged: (value) {
                  setState(() {
                    alupoori = value!;
                    getvalue(alupoori,20);

                  });
                },
                value: alupoori,
              ),
            ],
          ),

          Text("TOTAL = $a")
        ],
      )),
    );
  }
  int a = 0;

  void getvalue(bool status, int i) {
    if(status)
      {
        setState(() {
          a = a + i;
        });
      }else {

      setState(() {
        a = a -i;
      });

    }
  }
}
