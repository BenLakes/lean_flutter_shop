import 'package:flutter/material.dart';
import './pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用Container 作为根widget是为了 更好扩展 padding/margin
    return Container(
        child: MaterialApp(
          title: '商城学习',
          // debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.pink
          ),
          home: IndexPage(),
        ),
    );
  }
}