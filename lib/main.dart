import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation/bloc/cubit.dart';
import 'package:graduation/bloc/states.dart';
import 'package:graduation/languages/locale.dart';
import 'package:graduation/pages/forgetpassword.dart';
import 'package:graduation/pages/getstarted.dart';
import 'package:graduation/pages/homepage.dart';
import 'package:graduation/pages/login.dart';
import 'package:graduation/pages/signup.dart';
import 'package:graduation/sharedprefrences/sharedprefrences.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrange,
      statusBarIconBrightness: Brightness.light
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sharedprefs.init();
  bool isgetstarted = sharedprefs.getdata(key: "getstarted");
  bool islogin = sharedprefs.getdata(key: "login");
  if (isgetstarted == null) {
    runApp(MyApp(
      start: getstarted(),
    ));
  } else {
    if (islogin == null) {
      runApp(MyApp(
        start: login(),
      ));
    } else {
      runApp(MyApp(
        start: homepage(),
      ));
    }
  }
}

class MyApp extends StatelessWidget {
  // final bool isgetstarted ;
  // final bool islogin ;
  final Widget start;

  const MyApp({required this.start});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit(),
      child: BlocConsumer<cubit, states>(
        builder: (context, state) {
          return MaterialApp(

            debugShowCheckedModeBanner: false,
            ////////////////////////////////////////////////////////////////////////////////
            home: start ,
            localizationsDelegates: [
              AppLocale.delegate ,
              GlobalMaterialLocalizations.delegate ,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [
              Locale("en" , "") ,
              Locale("ar" , "")
            ],
            localeResolutionCallback: (current , support)
            {
              if(current != null)
                {
                  for(Locale locale in support)
                    {
                        if(locale.languageCode==current.languageCode)
                          {
                             return current;
                          }
                    }
                }
              return support.first;
            },
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
