import 'package:flutter/material.dart';

class radio extends StatefulWidget {
  @override
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,backgroundColor: Color(0xff5a054f),
        title: Text(
          "RESTRO BILL",
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.pink,Colors.red,Colors.white])),
            height: 50,

         child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Container(child: Text("No",),),
             Container(child: Text("Items"),),
             Container(child: Text("Rs"),),
             Container(child: Text("Plats",),),
             Container(child: Text("Select",),),
             Container(child: Text("Image"),),],
         ),
        ),
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.pink,Colors.red,Colors.white])),
            height: 250,
           child: ListView.builder(itemCount: 4,itemBuilder: (context, index) {
             return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Container(
                 child: Text(no[index]),
               ),
                 Container(
                 child: Text(item[index]),
               ),
                 Container(
                   child: Text(rs[index]),),
                 Container(
                 child: DropdownButton(hint: Text("Select"),
                   value: Selectedvalue,onChanged: <String>(value) {
                      setState(() {
                        Selectedvalue = value;
                      });
                 },items:getitems(),),
               ),
                 Container(
                 child: Checkbox(onChanged: (value) {
                   setState(() {

                     status[index]=value!;

                     getvalue(status[index],rs[index]);

                   });
                 },value:status[index],),
               ),
               Container(
                 height: 40,
                 width: 40,
                 decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/m1.jfif"))),
               )],
             );
           },),
          ),
          Container(
            height: 100,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 70,),
                Container(child: Text("Total",style: TextStyle(fontSize: 25),),
                ),
                Container(child: Text("Rs",style: TextStyle(fontSize: 25),)),
                Container(width: 80,
                  height:30,
                  child: Text("$a"),
                  decoration: BoxDecoration(border: Border.all(width: 1 ) ),)
              ]),),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.share_rounded))


        ],
      ),
    );
  }
  List item=["Vada pav","Dabeli","Samosa","Aloo puri"];
  List no=["1","2","3","4"];
  List dno=["1","2","3","4"];
  List<String> rs=["15","15","20","25"];
  List<bool> status=[false,false,false,false];
  int a=0;
  String? Selectedvalue;
  List <DropdownMenuItem> getitems()
  {
    List <DropdownMenuItem> id = <DropdownMenuItem>[];

    for(int i=0;i<dno.length;i++)
      {
        id.add(DropdownMenuItem(child: Text(dno[i]),value: dno[i],));
      }
    return id;
}

  void getvalue(bool status, String rs)
  {
    if(status)
      {
        a = a + int.parse(rs);
      }
    else
      {
        a =a-int.parse(rs);
      }
  }


}
