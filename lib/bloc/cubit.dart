import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/bloc/states.dart';
import 'package:graduation/models/user_model.dart';

class cubit extends Cubit<states> {
  cubit() : super(initialstate());

  static cubit get(context) => BlocProvider.of(context);
  int counter = 1;

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
      emit(signuperrorstate());
    });
  }

  void createUser({
    required String name,
    required String phone,
    required String id,
    required String? email,
  }) {
    userModel model = userModel(
      email: email,
      id: id,
      name: name,
      phone: phone,
    );
    emit(createuserloadingstate());
    FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(model.tomap()).then((value) {
      emit(createusersuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(createusererrorstate());
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
