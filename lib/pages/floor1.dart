import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/components/components.dart';

class floor1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/images/3.jpg") ,
                        fit: BoxFit.cover
                    )
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    topContainer(context , showmenu: false),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          slot(context,text: "P1", book: false, fill: true),
                          Spacer(),
                          slot(context,text: "P2", book: false,fill: false ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          slot(context,text: "P3", book: false,fill: false ),
                          Spacer(),
                          slot(context,text: "P4", book: false,fill: false ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          slot(context,text: "P5", book: false, fill: true),
                          Spacer(),
                          slot(context,text: "P6", book: false, fill: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}