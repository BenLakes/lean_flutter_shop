import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/details_info.dart';
import './details_page/details_top_area.dart';
import './details_page/details_explain.dart';
import './details_page/details_tabbar.dart';
import './details_page/detals_web.dart';
import './details_page/details_bottom.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    // _getBackInfo(context);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                print("返回上一页");
                Navigator.pop(context);
              }),
          title: Text('商品详细页')),
      body: FutureBuilder(
          future: _getBackInfo(context),
          builder: (context, snapshot) {
            print('snapshot.hasData->>${snapshot.hasData}');
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  ListView(
                     children: <Widget>[
                            DetailsTopArea(),
                      DetailsExplain(),
                      DetailsTabBar(),
                      DetailsWeb()
                     ],
                   ),
                   Positioned(child: DetailsBottom(), bottom: 0, left: 0)
                ],
              );
            } else {
              return Center(child: Text('加载中... ...'));
            }
          }),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    print("加载完成");
    return '加载完成';
  }
}
