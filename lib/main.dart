import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = Card(
      child: Column(
        children: <Widget>[
          ListTile(
             title: Text(
               "福建省厦门市湖里区",
               style: TextStyle(fontWeight: FontWeight.w500),
               ), 
               subtitle: Text("lee: 1512312312"),
               leading: Icon(Icons.add_call, color: Colors.lightBlue),
          ), 
          // 分割线
          Divider(),
          ListTile(
             title: Text(
               "福建省厦门市思明区",
               style: TextStyle(fontWeight: FontWeight.w500),
               ), 
               subtitle: Text("lee: 1512312312"),
               leading: Icon(Icons.add_call, color: Colors.lightBlue),
          ), 
          Divider(),
          ListTile(
             title: Text(
               "福建省厦门市集美区",
               style: TextStyle(fontWeight: FontWeight.w500),
               ), 
               subtitle: Text("lee: 1512312312"),
               leading: Icon(Icons.add_call, color: Colors.lightBlue),
          ), 
          Divider(),
          ListTile(
             title: Text(
               "福建省厦门市同安区",
               style: TextStyle(fontWeight: FontWeight.w500),
               ), 
               subtitle: Text("lee: 1512312312"),
               leading: Icon(Icons.add_call, color: Colors.lightBlue),
          ), 
          Divider(),
          ListTile(
             title: Text(
               "福建省厦门市翔安区",
               style: TextStyle(fontWeight: FontWeight.w500),
               ), 
               subtitle: Text("lee: 1512312312"),
               leading: Icon(Icons.add_call, color: Colors.lightBlue),
          ), 
          Divider(),
        ],
      ),
    );
      
    return MaterialApp(
      title: "Hello Lee Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("垂直方向布局 Demo"),
        ),
        body: Center(
          child: card,
        ),
      ),
    );
  }
}
