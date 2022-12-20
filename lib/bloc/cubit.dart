import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/bloc/states.dart';

class cubit extends Cubit<states>
{
  cubit() : super(initialstate()) ;
  static cubit get(context) => BlocProvider.of(context) ;
  int counter = 1 ;

  void plus()
  {
    counter++;
    emit(counterchange()) ;
  }
  void minus()
  {
    if(counter>1)
      {
        counter--;
      }
    else
      {
        counter=1;
      }
    emit(counterchange()) ;
  }

}