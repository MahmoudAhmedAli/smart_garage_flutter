import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation/bloc/cubit.dart';
import 'package:graduation/bloc/states.dart';
import 'package:graduation/components/components.dart';
import 'package:graduation/languages/locale.dart';
import 'package:graduation/pages/homepage.dart';
import 'package:graduation/pages/settings.dart';
import 'package:graduation/shared.dart';
import 'package:graduation/sharedprefrences/sharedprefrences.dart';

class update extends StatelessWidget {
  const update({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailtext = TextEditingController();
    var nametext = TextEditingController();
    var phonetxt = TextEditingController();
    emailtext.text = email;
    nametext.text = name;
    phonetxt.text = phone;
    return BlocConsumer<cubit, states>(
      builder: (context , state)
      {
        var emailtext = TextEditingController();
        var nametext = TextEditingController();
        var phonetxt = TextEditingController();
        emailtext.text = email;
        nametext.text = name;
        phonetxt.text = phone;
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
                      child: Column(
                        children: [

                          editText(context,
                              ispassword: false,
                              type: TextInputType.name,
                              text: nametext.text,
                              prefixIcon: Icons.person_outline,
                              controller: nametext),
                          SizedBox(
                            height: 10,
                          ),
                          editText(context,
                              ispassword: false,
                              type: TextInputType.emailAddress,
                              text: phonetxt.text,
                              prefixIcon: Icons.phone_outlined,
                              controller: phonetxt),
                          SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: state is! updateloadingstate,
                            builder: (context)=>button(
                                context: context,
                                text: "${getLang(context, "update")}",
                                function: (){

                                  cubit.get(context).update(namee: nametext.text, phonee: phonetxt.text);
                                },
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
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
      listener: (context , state){
        if(state is updatesuccessstate)
          {
            Fluttertoast.showToast(
                msg: "${getLang(context, "updatesuccess")}",
                backgroundColor: Colors.green,
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => homepage(),
                ),
                    (route) => false);
          }else if(state is updateerrorstate)
            {
              Fluttertoast.showToast(
                  msg: "${getLang(context, "updatefail")}",
                  backgroundColor: Colors.red,
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: Colors.white,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1);
            }
      },
    );
  }
}
