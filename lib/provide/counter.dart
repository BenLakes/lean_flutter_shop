import 'package:flutter/material.dart';

// ChangeNotifier  意思不用管理听众，
class Counter with ChangeNotifier {
  int value = 0;

  increment(){
    value ++;
    notifyListeners();
  }
}