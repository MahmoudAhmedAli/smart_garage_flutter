import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/bloc/states.dart';
import 'package:graduation/models/user_model.dart';
import 'package:graduation/shared.dart';
import 'package:graduation/sharedprefrences/sharedprefrences.dart';

class cubit extends Cubit<states> {
  cubit() : super(initialstate());

  static cubit get(context) => BlocProvider.of(context);
  int counter = 1;
  userModel? model ;
  void register({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(signuploadingstate());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        name: name,
        phone: phone,
        id: value.user!.uid,
        email: value.user!.email,
      );
      emit(signupsuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(signuperrorstate(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String phone,
    required String id,
    required String? email,
  }) {
     model = userModel(
      email: email,
      id: id,
      name: name,
      phone: phone,
    );
    emit(createuserloadingstate());
    FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(model!.tomap())
        .then((value) {
      emit(createusersuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(createusererrorstate());
    });
  }

  void getUser() {
    emit(getuserloadingstate());
    FirebaseFirestore.instance
        .collection("users")
        .doc(sharedprefs.getdata(key: "UID"))
        .get()
        .then((value) {
          name = value.data()!['name'];
      phone = value.data()!['phone'];
      email = value.data()!['email'];
      print(name);
      print(phone);
      print(sharedprefs.getdata(key: "UID"));
      emit(getusersuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(getusererrorstate());
    });

  }

  void update(
  {
  required String namee ,
  required String phonee,
}
      )
  {
    emit(updateloadingstate());
    FirebaseFirestore.instance.collection("users").doc(sharedprefs.getdata(key: "UID")).update(
        {
          "name" : namee,
          "phone" : phonee,
        }
    ).then((value)
    {
      print("ok");
      emit(updatesuccessstate());

    }).catchError((error)
    {
      print(error.toString());
      emit(updateerrorstate());
    });
  }
  void login({
    required String email,
    required String password,
  }) {
    emit(loginloadingstate());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      sharedprefs.savedata(key: "UID", value: value.user!.uid) ;
      print(value.user!.email);
      print(value.user!.uid);

      emit(loginsuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(loginerrorstate());
    });
  }

  void plus() {
    counter++;
    emit(counterchange());
  }

  void minus() {
    if (counter > 1) {
      counter--;
    } else {
      counter = 1;
    }
    emit(counterchange());
  }
}
