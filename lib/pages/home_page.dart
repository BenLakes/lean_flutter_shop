import 'package:flutter/material.dart';
import 'package:lean_flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import '../config/service_url.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
            // GridView 数据
            List<Map> navigatorList = (data['data']['category'] as List).cast();
            // 广告图片
            String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS'];
            String leaderImage = data['data']['shopInfo']['leaderImage'];
            String leaderPhone = data['data']['shopInfo']['leaderPhone'];

            return Column(
               children: <Widget>[
                 SwiperDiy(swiperDataList),
                 TopNavigator(navigatorList),
                 AdBanner(advertesPicture),
                 LeaderPhone(leaderImage, leaderPhone),
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



// 导航GridView 部件编写
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator(this.navigatorList);
//  _gridViewItemUI 构建单个 item
  Widget _gridViewItemUI(BuildContext context, item) {
    //  InkWell 点击有水波纹效果， 而 GestureDetector 没有
     return InkWell(
         onTap: () {
           print('点击了导航'); 
        },
        child: Column(
           children: <Widget>[
             Image.network(
               item['image'],
               width: ScreenUtil().setWidth(95),
               ),
               Text(item['mallCategoryName']),
           ], 
        ),
     ); 
  }
  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      navigatorList.removeLast();
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        children: navigatorList.map((item){
           return _gridViewItemUI(context, item); 
        }).toList(),
      ),
      
    );
  }
}

// 广告图片
class AdBanner extends StatelessWidget {
  final String advertesPicture;
  AdBanner(this.advertesPicture);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(this.advertesPicture),
    );
  }
}

// 店长栏位 点击拨打电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage;  //店长图片
  final String leaderPhone; //店长电话
  LeaderPhone(this.leaderImage, this.leaderPhone);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(this.leaderImage),
      ),
    );
  }
  // 拨打电话方法
  void _launchURL() async{
     String url = 'tel:'+this.leaderPhone;
     print(this.leaderPhone);
    //  校验数据是否合法
     if (await canLaunch(url)) {
       await launch(url);
     } else {
        //不合法抛出错误 
      throw 'Could not launch $url';
     }
  }
}