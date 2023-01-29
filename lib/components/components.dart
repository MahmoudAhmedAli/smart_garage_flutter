
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/pages/login.dart';
import 'package:graduation/pages/settings.dart';
import 'package:graduation/pages/book_screen.dart';
import 'package:graduation/sharedprefrences/sharedprefrences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:graduation/languages/locale.dart';


Widget topContainer(context , {required bool showmenu}) {
  List<PopupMenuEntry> list = [
    PopupMenuItem(
      value: 0,
      child:  Row(
          children: [
            Icon(
              Icons.settings
            ),
            SizedBox(width: 10,) ,
            Text("Settings")
          ],
        ),
    ),
    PopupMenuItem(
      value: 1,
      child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
                Icons.logout
            ),
            SizedBox(width: 10,) ,
            Text("Logout")
          ],
        ),
      ),
  ];
  return Stack(alignment: Alignment.topLeft, children: [
    Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 5.0, offset: Offset(0, 2)),
          BoxShadow(color: Colors.deepOrange, offset: Offset(-5, 0)),
        ],
      ),
      width: double.infinity,
      height: 170.0,
      child: Image(
        image: AssetImage("lib/images/1.PNG"),

        width: 50,

        // height: 120,
      ),
    ),
    if(showmenu)
    PopupMenuButton(
      color: Colors.grey[200],
        itemBuilder: (context) => list,
        icon: Icon(
            Icons.more_vert_rounded ,
        color: Colors.white) ,
     onSelected: (value){
        if(value==1)
          {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>login()), (route) => false);
            sharedprefs.removedata(key: "login") ;
          }
        else if(value==0)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>settings())) ;
          }
     },),
  ]);
}

Widget slot( context, {required String text,required bool book,required bool fill}) => Column(
  children: [
    Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: fill ? Colors.green:Colors.red,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(blurRadius: 5.0, offset: Offset(0, 2)),
          BoxShadow(color: Colors.white, offset: Offset(-1, 0)),
        ],
      ),
    ),
    SizedBox(height: 15,),
    Container(
      width: 120,
      height: 70,
      decoration: BoxDecoration(
        color: HexColor('#323232'),
        border: Border.all(color: Colors.white, width: 5),
        boxShadow: [
          BoxShadow(blurRadius: 5.0, offset: Offset(0, 2)),
          BoxShadow(color: Colors.white, offset: Offset(-1, 0)),
        ],
      ),
      child: Center(
        child: Text(
          "$text",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),
        ),
      ),
    ),
    SizedBox(height: 15,),
    if(book&&fill)
      Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [
              BoxShadow(blurRadius: 5.0, offset: Offset(0, 1)),
              BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
            ]),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => BookScreen(location: text,)));
          }
          ,child: Text(
          '${getLang(context, "book")}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black

          ),),
        ),
      ),

  ],
);

Widget button({
  required context,
  required String text,
  required Function() function,
  double fontsize = 20,
}) =>
    Container(
      width: 300,

      decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(blurRadius: 5.0, offset: Offset(0, 1)),
            BoxShadow(color: Colors.deepOrange, offset: Offset(-5, 0)),
          ]),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          "$text",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontsize),
        ),
      ),
    );

Widget editText(
    context ,
        {required bool ispassword,
        required TextInputType type,
        required String text,
        required IconData prefixIcon,
        IconData? suffixIcon,
        Function()? function,
        required TextEditingController controller}) =>
    Container(
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(25) ,
          boxShadow: [
            BoxShadow(blurRadius: 5.0, offset: Offset(0, 5)),
            BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
          ]),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "${text + getLang(context, 'cantempty')}";
          }
          return null;
        },
        keyboardType: type,
        obscureText: ispassword,

        decoration: InputDecoration(
          labelText: text,
          prefixIcon: Icon(
            prefixIcon,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: function, icon: Icon(suffixIcon))
              : null,
        ),
      ),
    );
