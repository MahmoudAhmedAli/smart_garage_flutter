import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/components/components.dart';
import 'package:graduation/languages/locale.dart';

import 'package:graduation/pages/signup.dart';
import 'package:graduation/sharedprefrences/sharedprefrences.dart';

class getstarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: topContainer(context , showmenu: false)),
            SizedBox(
              height: 30,
            ),
          Expanded(
            flex: 3,
            child: Column (
              children: [
                Text(
                  "${getLang(context, "welcome")}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text (
                  "${getLang(context, "title")}",

                  style: TextStyle(color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image (
                  image: AssetImage("lib/images/2.PNG"),
                  width: double.infinity,
                  // height: 120,
                ),
              ],
            ),
          ) ,
           
            Expanded(
              child: Column(
                children: [
                  button(
                      context: context,
                      text: "${getLang(context, "Getstarted")}",
                      function: () {
                        sharedprefs.savedata(key: "getstarted", value: true) ;
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => signup()),
                                (route) => false);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${getLang(context, "Letstarted")}",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => signup()),
                                    (route) => false);
                          },
                          child: Text(
                            "${getLang(context, "signup")}",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              ),
            ) ,

          ],
        ),
      ),
    );
  }
}
