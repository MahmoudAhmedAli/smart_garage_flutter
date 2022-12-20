import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation/bloc/cubit.dart';
import 'package:graduation/bloc/states.dart';
import 'package:graduation/components/components.dart';
import 'package:graduation/languages/locale.dart';
import 'package:graduation/pages/forgetpassword.dart';
import 'package:graduation/pages/homepage.dart';
import 'package:graduation/pages/signup.dart';
import 'package:graduation/sharedprefrences/sharedprefrences.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  var emailtext = TextEditingController() ;

  var passwordtxt = TextEditingController() ;
bool ispass = true ;
  var formkey = GlobalKey<FormState>() ;
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
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            editText(context ,
                              controller:emailtext ,
                              ispassword: false,
                              type: TextInputType.emailAddress,
                              text: "${getLang(context, "email")}",
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
                                suffixIcon: ispass ? Icons.visibility : Icons.visibility_off ,
                                function: (){
                                  setState(() {
                                    ispass = !ispass ;

                                  }); ;
                                }
                            ) ,
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>forgetpassword())) ;
                              },
                              child: Text(
                                "${getLang(context, "forgetpass")}" ,
                                style: TextStyle(
                                    color: Colors.deepOrange ,
                                    fontSize: 16 ,
                                    fontWeight: FontWeight.bold
                                ),) ,
                            ) ,
                            SizedBox(height: 30,),
                            button(context: context, text: "${getLang(context, "login")}",
                                function: (){
                              sharedprefs.savedata(key: "login", value: true) ;

                              if(formkey.currentState!.validate())
                              {
                                Fluttertoast.showToast(
                                    msg: "${getLang(context, "loginsuccessfully")}",
                                    backgroundColor: Colors.green,
                                    toastLength: Toast.LENGTH_SHORT,
                                    textColor: Colors.white,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1);
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>homepage()), (route) => false);
                              }
                            } , fontsize: 25) ,
                            SizedBox(height: 20,) ,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${getLang(context, "donthaveaccount")}",
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>signup())) ;
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
