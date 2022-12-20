import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/components/components.dart';

class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(

            children:[
              topContainer(context, showmenu: true) ,
              SizedBox(height: 200,) ,
              Text("Settings page...Coming soon👀" ,
                style: TextStyle(
                  color: Colors.black ,
                  fontWeight: FontWeight.bold ,
                  fontSize: 20
                ),),]
          ),
        ),
      ),
    );
  }
}
