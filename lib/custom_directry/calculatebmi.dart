import 'dart:math';

import 'package:flutter/material.dart';

class Bmi{
  final double height;
  final double weight;
  double _bmi;

  Bmi({this.height, this.weight});
  String calculateBmi(){
    _bmi = (weight/pow(height/100, 2));
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return "overweight";
    }else if(_bmi>18.5){
      return "Normal";
    }else{
      return "underweight";
    }
  }
  String getInterperation(){
    if(_bmi>=25){
      return "Do Excercise";
    }else if(_bmi>18.5){
      return "Enjoy!";
    }else{
      return "Eat Some Food";
    }
  }
}