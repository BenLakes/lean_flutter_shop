import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';

  static void configureRoutes(Router router){
     router.notFoundHandler = Handler(
       handlerFunc: (BuildContext context, Map<String, List<String>>params){
         print("Error===>Route Was Not Found");
       }
     );
     router.define(detailsPage, handler: detailsHandler);
  }
}