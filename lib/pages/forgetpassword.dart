import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation/bloc/cubit.dart';
import 'package:graduation/bloc/states.dart';
import 'package:graduation/components/components.dart';
import 'package:graduation/languages/locale.dart';
import 'package:graduation/pages/login.dart';

class forgetpassword extends StatefulWidget {
  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  var emailtext = TextEditingController();

  var newpasswordtxt = TextEditingController();

  var confpasswordtxt = TextEditingController();

  bool ispass = true;

  bool isconfpass = true;

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubit, states>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  topContainer(context, showmenu: false),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          editText(
                            context,
                            controller: emailtext,
                            ispassword: false,
                            type: TextInputType.emailAddress,
                            text: "${getLang(context, "email")}",
                            prefixIcon: Icons.email,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          editText(context,
                              controller: newpasswordtxt,
                              ispassword: ispass,
                              type: TextInputType.visiblePassword,
                              text: "${getLang(context, "pass")}",
                              prefixIcon: Icons.lock,
                              suffixIcon: ispass
                                  ? Icons.visibility
                                  : Icons.visibility_off, function: () {
                            setState(() {
                              ispass = !ispass;
                            });
                            ;
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          editText(context,
                              controller: confpasswordtxt,
                              ispassword: isconfpass,
                              type: TextInputType.visiblePassword,
                              text: "${getLang(context, "confpass")}",
                              prefixIcon: Icons.lock,
                              suffixIcon: isconfpass
                                  ? Icons.visibility
                                  : Icons.visibility_off, function: () {
                            setState(() {
                              isconfpass = !isconfpass;
                            });
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          button(
                            context: context,
                            text: "${getLang(context, "resetpass")}",
                            function: () {
                              if (formkey.currentState!.validate()) {
                                Fluttertoast.showToast(
                                    msg:
                                        "${getLang(context, "Resetpasswordsuccessfully")}",
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
                            fontsize: 25,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${getLang(context, "rememberpass")}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
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
        );
      },
      listener: (context, state) {},
    );
  }
}
