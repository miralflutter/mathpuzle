import 'package:flutter/material.dart';
import 'package:mathpuzle/main.dart';
import 'package:mathpuzle/secondpage.dart';

class third extends StatefulWidget {

  int level;
  third(this.level);


  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    double totalheight = MediaQuery.of(context).size.height;
    double totalwidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navigationbarheight = MediaQuery.of(context).padding.bottom;

    double bodyheight = totalheight - statusbarheight - navigationbarheight;

    return Scaffold(
      body: Container(
        height: totalheight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: statusbarheight,
            ),
            Container(
              height: bodyheight * .15,
              child: Center(
                child: Text(
                  "PUZZLE ${widget.level} COMPLETED",
                  style: TextStyle(
                      fontSize: bodyheight * .04, color: Color(0xff0a1574)),
                ),
              ),
            ),
            Container(
              height: bodyheight * .35,
              child: Image(
                image: AssetImage("images/trophy.png"),
                fit: BoxFit.fill,
              ),
            ),
            InkWell(onTap: () {

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return second(widget.level);

              },));
            },
              child: Container(
                height: bodyheight * .080,
                width: totalwidth * .5,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.grey,Colors.white,Colors.grey]),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                ),
                child: Center(child: Text("CONTINUE",style: TextStyle(fontSize: 25,color: Colors.black),)),
              ),
            ),
            InkWell(onTap: () {

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                return first();
              },));
            },
              child: Container(
                margin: EdgeInsets.all(10),
                height: bodyheight * .080,
                width: totalwidth * .5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.grey,Colors.white,Colors.grey]),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                ),
                child: Center(child: Text("MAIN MENU",style: TextStyle(fontSize: 25,color: Colors.black),)),
              ),
            ),
            Container(
              height: bodyheight * .080,
              width: totalwidth * .5,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.grey,Colors.white,Colors.grey]),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: Center(child: Text("BUY PRO",style: TextStyle(fontSize: 25,color: Colors.black),)),
            ),
            Container(
              height: bodyheight * .070,
              width: totalwidth * .7,
             child: Center(child: Text("SHERE THIS PUZZLE",style: TextStyle(fontSize: 30,color: Color(
                 0xff2d24b4)),)),
            ),
            InkWell(onTap: () {

            },
              child: Container(
                height: bodyheight * .070,
                width: totalwidth * .2,
                child: Icon(Icons.share_rounded,size: 35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1),
                    gradient: LinearGradient(colors: [Colors.grey,Colors.white,Colors.grey]),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
