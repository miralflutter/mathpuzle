import 'package:flutter/material.dart';
import 'package:mathpuzle/classpage.dart';
import 'package:mathpuzle/secondpage.dart';

class puzzle extends StatefulWidget {
  @override
  State<puzzle> createState() => _puzzleState();
}

class _puzzleState extends State<puzzle> {
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
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: statusbarheight,
            ),
            Container(
              height: bodyheight * .08,
              child: Center(
                child: Text(
                  "SELECT PUZZLE",
                  style: TextStyle(
                      fontSize: bodyheight * .04, color: Color(0xff102e9a)),
                ),
              ),
            ),
            Container(
              height: bodyheight * .75,
              width: totalwidth,
              child: GridView.builder(
                      itemCount: 75,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    String levelstatus = model.statuslist[index];
                    int level = model.prefs!.getInt("level") ?? 0;

                    if (levelstatus == "clear") {
                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return second(index);
                            },
                          ));
                        },
                        child: Container(
                          child: Center(
                            child: Text("${index+1}",style: TextStyle(fontSize: 20),
                            ),
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1),
                              image: DecorationImage(
                                image: AssetImage("images/tick.png"),
                              )),
                        ),
                      );
                    } else if (levelstatus == "skip") {
                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return second(index);
                            },
                          ));
                        },
                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1)),
                          child: Center(
                            child: Text(
                              "${index+1}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    } else {
                      //pending
                      if (level == index) {
                       return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return second(index);
                                    },
                                  ));
                            },
                            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1)),child: Center(child: Text("${index + 1}",style: TextStyle(fontSize: 20),))));
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/lock.png"))),
                        );
                      }
                    }
                  },
              ),
            )
          ],
        ),
      ),
    );
  }

// String image="lock.png";
}
