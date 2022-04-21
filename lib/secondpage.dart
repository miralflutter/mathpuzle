import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzle/classpage.dart';
import 'package:mathpuzle/third%20page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class second extends StatefulWidget {

  int level;
  second(this.level);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  @override
  Widget build(BuildContext context) {
    double totalheight = MediaQuery.of(context).size.height;
    double totalwidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navigationbarheight = MediaQuery.of(context).padding.bottom;

    double bodyheight = totalheight - statusbarheight - navigationbarheight;

    return Scaffold(
      body: Container(
        height: bodyheight,
        width: totalwidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/gameplaybackground.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: statusbarheight,
            ),
            Row(
              children: [
                InkWell(onTap: () {
                 model.statuslist[widget.level]="skip";
                 model.prefs!.setString("status${widget.level}","skip" );
                 print(model.statuslist);

                setState(() {
                  widget.level++;
                });
                 model.prefs!.setInt("level", widget.level);

                 print(widget.level);

                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                   return second(widget.level);
                 },));
                },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage("images/skip.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: bodyheight * .10,
                    width: 280,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/level_board.png"))),
                    child: Center(
                        child: Text(
                      "PUZZLE ${widget.level+1}",
                      style: TextStyle(
                          fontSize: bodyheight * .04, color: Colors.black),
                    )),
                  ),
                ),
                InkWell(onTap:  () {

                },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage("images/hint.png"),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: bodyheight * .5,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/p${widget.level+1}.png"), fit: BoxFit.fill)),
            ),
            Expanded(child: Container()),
            Container(
              height: bodyheight * .08,
              color: Colors.black,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 200,
                    child: Text(
                      "${model.s}",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                       model.s  = model.s.substring(0, model.s.length - 1);
                      });
                    },
                    child: Container(
                      child: Image(image: AssetImage("images/delete.png")),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                        if (model.s == model.ans[widget.level])
                        {
                          String levelstatus=model.statuslist[widget.level];
                          {
                            if (levelstatus == "clear") {
                              model.prefs!.setInt("level", widget.level);
                              model.s="";

                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) {
                                  return third(widget.level+1);
                                },
                              ));
                            }
                            else if(levelstatus == "skip")
                              {
                                model.statuslist[widget.level]="clear";
                                model.prefs!.setString("status${widget.level}","clear" );
                                model.s="";
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) {
                                    return third(widget.level+1);

                                  },
                                ));
                              }
                            else
                              {

                                  setState(() {
                                    model.statuslist[widget.level]="clear";
                                    model.prefs!.setString("status${widget.level}","clear" );
                                      widget.level++;
                                      model.s="";
                                    model.prefs!.setInt("level", widget.level);
                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) {
                                      return third(widget.level);
                                    },
                                                                    ));
                                  });

                              }
                          }

                        }
                        else
                        {
                          Fluttertoast.showToast(
                              msg: "your Answer is inncorrect",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20.0);
                        }

                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Center(
                          child: Text(
                        "SUBMIT",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: bodyheight * .06,
              color: Colors.black,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        model.s = "${model.s}" + "${index}";
                      });
                    },
                    child: Container(
                      height: 20,
                      width: totalwidth * .089,
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      child: Center(
                          child: Text(
                        "${index}",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
