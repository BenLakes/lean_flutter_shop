import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 文本编辑控制器  可获得 输入值
  TextEditingController typeController = TextEditingController();

  String showText = "欢迎你来到美好人间";

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
          appBar: AppBar(title: Text("美好人间"),),
          body: Container(
            height: 1000,
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                  TextField(
                    controller: typeController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: '美女类型',
                      helperText: '请输入美女类型',
                      border: OutlineInputBorder(),
                      hintText: '请输入账号',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  // 当需要调用接口时候  点击按钮
                  RaisedButton(
                    onPressed: _choiceAction,
                    child: Text("选择完毕"),
                  ),
                  Text(
                    showText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
              ],
            ),
          ),
       ),
    );
  }
  // 按钮事件
 void _choiceAction () async {
   print("开始选择你喜欢的类型........");
   if (typeController.text.toString() == '') {
    //  显示提示
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text("美女类型不能为空"),)
    );
   } else {
// 不为空请求网络
     var res = await _getHttp(typeController.text.toString());
     print("res === ${res}");
     setState(() {
       showText = res['data']['name'].toString();
     });
   }
 }
  
  Future _getHttp(String typeText) async {
     try {
       Response response;
       var data = {'name': typeText};
       response = await Dio().get('https://www.easy-mock.com/mock/5e1dcdd5fe6d23409285a687/example/getTest',
       queryParameters: data);
       print(response.data);
       return response.data;
     } catch (e) {
       return print(e);
     }



  }

}