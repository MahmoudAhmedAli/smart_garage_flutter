import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/bloc/cubit.dart';
import 'package:graduation/bloc/states.dart';
import 'package:graduation/components/components.dart';
import 'package:graduation/languages/locale.dart';
import 'package:graduation/pages/floor1.dart';
import 'package:graduation/pages/floor2.dart';

class homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => cubit()..getUser(),
    child: BlocConsumer<cubit , states>(
        builder: (context , state)
        {
         return Scaffold(
            backgroundColor: Colors.grey[200],
            body: SafeArea (
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    topContainer (context , showmenu: true) ,
                    SizedBox(height: 80,) ,
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> floor1())) ;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20) ,
                                boxShadow: [BoxShadow(blurRadius: 5 , offset: Offset(0,5)) ,
                                  BoxShadow(color: Colors.white , offset: Offset(-5,0)) ,]
                            ),
                            width: 250,
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${getLang(context, "firstfloor")}" ,
                                  style: TextStyle(
                                      color: Colors.black ,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: 25
                                  ),
                                ) ,
                                SizedBox(height: 10,),
                                Text(
                                  "${getLang(context, "public")}" ,
                                  style: TextStyle(
                                      color: Colors.grey[500] ,
                                      fontSize: 18
                                  ),
                                ) ,
                                SizedBox(height: 10,),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.grey,
                                ) ,
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${getLang(context, "empty")}" ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),
                                    ) ,
                                    SizedBox(width: 10,) ,
                                    Text(
                                      "5/6" ,
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),
                                    ) ,
                                  ],
                                )
                              ],
                            ),
                          ),
                        ) ,
                        SizedBox(height: 30,) ,
                        InkWell(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> floor2()));},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20) ,
                                boxShadow: [BoxShadow(blurRadius: 5 , offset: Offset(0,5)) ,
                                  BoxShadow(color: Colors.white , offset: Offset(-5,0)) ,]
                            ),
                            width: 250,
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${getLang(context, "secondfloor")}" ,
                                  style: TextStyle(
                                      color: Colors.black ,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: 25
                                  ),
                                ) ,
                                SizedBox(height: 10,),
                                Text(
                                  "${getLang(context, "private")}" ,
                                  style: TextStyle(
                                      color: Colors.grey[500] ,
                                      fontSize: 18
                                  ),
                                ) ,
                                SizedBox(height: 10,),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.grey,
                                ) ,
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${getLang(context, "empty")}" ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),
                                    ) ,
                                    SizedBox(width: 10,) ,
                                    Text(
                                      "2/6" ,
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),
                                    ) ,
                                  ],
                                )
                              ],
                            ),
                          ),
                        ) ,

                      ],
                    ) ,

                  ],
                ),
              ),
            ),
          );
        },
        listener:(context , state){} )
    );
  }
}
