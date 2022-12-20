import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation/bloc/cubit.dart';
import 'package:graduation/bloc/states.dart';
import 'package:graduation/components/components.dart';
import 'package:graduation/languages/locale.dart';
import 'package:graduation/pages/login.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var emailtext = TextEditingController() ;
  var nametext = TextEditingController() ;

  var passwordtxt = TextEditingController() ;

  var confpasswordtxt = TextEditingController() ;

  var phonetxt = TextEditingController() ;

  var formkey = GlobalKey<FormState>() ;
bool ispass = true ;
bool isconfpass = true ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubit , states>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    topContainer(context , showmenu: false),
                    SizedBox(
                      height: 20,
                    ),
                    Padding (
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            editText(context ,
                                controller: nametext,
                                ispassword: false,
                                type: TextInputType.text,
                                text: "${getLang(context, "name")}",
                                prefixIcon: Icons.person,
                             ),
                            SizedBox(
                              height: 10,
                            ),
                            editText(context,
                              controller: emailtext,
                              ispassword: false,
                              type: TextInputType.emailAddress,
                              text:"${getLang(context, "email")}" ,
                              prefixIcon: Icons.email,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            editText(context ,
                                controller: passwordtxt,
                                ispassword: ispass,
                                type: TextInputType.visiblePassword,
                                text: "${getLang(context, "pass")}",
                                prefixIcon: Icons.lock,
                                suffixIcon: ispass ? Icons.visibility : Icons.visibility_off,
                                function: () {
                                  setState(() {
                                    ispass = !ispass ;
                                  }); ;
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            editText(context ,
                                controller: confpasswordtxt,
                                ispassword:isconfpass,
                                type: TextInputType.visiblePassword,
                                text: "${getLang(context, "confpass")}",
                                prefixIcon: Icons.lock,
                                suffixIcon: isconfpass ? Icons.visibility : Icons.visibility_off,
                                function: () {
                                  setState(() {
                                    isconfpass = !isconfpass ;
                                  }); ;                                }),
                            SizedBox(
                              height: 10,
                            ),
                            editText(context ,
                              controller: phonetxt,
                              ispassword: false,
                              type: TextInputType.phone,
                              text: "${getLang(context, "phone")}",
                              prefixIcon: Icons.phone,),

                            SizedBox(
                              height: 30,
                            ),
                            button(
                                context: context,
                                text: "${getLang(context, "signup")}",
                                function: () {
                                  if(formkey.currentState!.validate())
                                  {
                                    Fluttertoast.showToast(
                                        msg: "${getLang(context, "createsuccessfully")}",
                                        backgroundColor: Colors.green,
                                        toastLength: Toast.LENGTH_SHORT,
                                        textColor: Colors.white,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => login(),
                                        ),
                                            (route) => false);
                                  }
                                },
                                fontsize: 25),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${getLang(context, "haveaccount")}",
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => login(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "${getLang(context, "login")}",
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ) ;
        },
        listener: (context, state) {

        },);
  }
}
