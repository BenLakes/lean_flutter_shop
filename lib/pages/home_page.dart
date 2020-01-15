import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:lean_flutter_shop/service/service_method.dart';
import '../config/service_url.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String homePageContent = '正在获取数据';

  @override
  void initState() {
    getHomePageContent().then((val){
       setState((){
         homePageContent = val.toString(); 
       }); 
    }); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("学习商城")
      ),
      body: SingleChildScrollView(
        child: Text(homePageContent),
      ),
    );
  }
}