import 'package:flutter/material.dart';
import 'package:mathpuzle/classpage.dart';
import 'package:mathpuzle/puzzlelevel4.dart';
import 'package:mathpuzle/secondpage.dart';
import 'package:mathpuzle/stringvalue.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dropdownbutton.dart';
import 'menu.dart';

void main() {
  runApp(MaterialApp(
    home: radio(),
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  bool sstatus = false;
  int? level;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() async {
    model.prefs = await SharedPreferences.getInstance();
    level = model.prefs!.getInt("level") ?? 0;

    setState(() {
      sstatus = true;
    });
    for(int i=0;i<75;i++)
      {
        model.levelstatus = model.prefs!.getString("status$i")??"pending";
        model.statuslist.add(model.levelstatus);
        print(model.statuslist);
      }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double totalheight = MediaQuery.of(context).size.height;
    double totalwidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navigationbarheight = MediaQuery.of(context).padding.bottom;

    double bodyheight = totalheight - statusbarheight - navigationbarheight;

    return sstatus?Scaffold(
      body: Container(
        height: bodyheight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/background.jpg",
                ),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: statusbarheight,
            ),
            Container(
              height: bodyheight * .25,
              child: Center(
                child: Text(
                  "MATH PUZZLE",
                  style: TextStyle(
                      fontSize: bodyheight * .06, color: Color(0xff101286)),
                ),
              ),
            ),
            Container(
              height: bodyheight * .5,
              width: totalwidth,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/blackboard_main_menu.png"),
                      fit: BoxFit.fill)),
              child: Container(
                // padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(110),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return second(level!);
                            },
                          ));
                        },
                        child: Container(
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return puzzle();
                          },
                        ));
                      },
                      child: Container(
                        child: Text(
                          "PUZZLE",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "BUY PRO",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ):Center(child: CircularProgressIndicator());
  }

}
// Tex♦t

