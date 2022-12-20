import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/components/components.dart';


class floor2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/images/3.jpg") ,
                          fit: BoxFit.cover,
                          repeat:ImageRepeat.repeatY
                      )

                  )
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    topContainer(context , showmenu: false),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          slot(context,text: "P1", book: true, fill: true),
                          Spacer(),
                          slot(context,text: "P2", book: true,fill: true ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          slot(context,text: "P3", book: true,fill: true ),
                          Spacer(),
                          slot(context,text: "P4", book: true, fill: false),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          slot(context,text: "P5", book: true,fill: false, ),
                          Spacer(),
                          slot(context,text: "P6", book: true,fill: true ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}