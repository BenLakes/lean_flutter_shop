import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(child: Text('商城首页'),),
    );
  }

  void getHttp()async{
    try {
      Response response ;
      var data = {'name': 'Lee'};
       response = await Dio().get(
        "https://www.easy-mock.com/mock/5e1dcdd5fe6d23409285a687/example/getTest?name=123123",
        //  queryParameters:data
      ); 
      print(response);
    } catch (e) {
      return print(e);
    }
  }
}