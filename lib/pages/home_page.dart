import 'package:flutter/material.dart';
import 'package:lean_flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import '../config/service_url.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("学习商城")
      ),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            // 格式化为 对象 数据格式
            var data = json.decode(snapshot.data.toString());
            //顶部轮播图片数据
            List<Map> swiperDataList = (data['data']['slides'] as List).cast();
            return Column(
               children: <Widget>[
                 SwiperDiy(swiperDataList),
               ], 
            );
          }else {
            return Center(child: Text('加载中'));
          }
        },
      ),
    );
  }
}
// 首页轮播组件
class SwiperDiy extends StatelessWidget {
  // 轮播图片 数组
  final List swiperDataList;
  SwiperDiy(this.swiperDataList);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    // 使用库适配库打印一些 比例 宽度 等信息
    print('设备宽度: ${ScreenUtil.screenWidth}');
    print('设备高度: ${ScreenUtil.screenHeight}');
    print('设备像素密度: ${ScreenUtil.pixelRatio}');

    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network("${swiperDataList[index]['image']}", fit: BoxFit.fill,);
        },
        itemCount: swiperDataList.length,
        // 下面的小点点
        pagination: SwiperPagination(),
        // 是否自动滚动
        autoplay: true,
      ),
    );
  }
}