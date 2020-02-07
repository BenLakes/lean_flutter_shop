import 'package:flutter/material.dart';
import '../model/category.dart';

// ChangeNotifier 的混入是不用管理听众
class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  // 大类选中下标
  int childIndex = 0;
  // 大类选中ID
  String categoryId = '4';
  // 小类选中Id
  String subId = ''; 

  // 商品分类列表 页数 当改变大类或者小类时 进行改变
  int page = 1;
  // 显示更多的标识
  String noMoreText = '';
  // 点击大类时更换
  getChildCategory(List<BxMallSubDto> list, String id) {
    categoryId = id;
    childIndex = 0;

  //  大类切换时候把 页码 和  noMoreText 改变
  page = 1;
  noMoreText = '';

    subId = ''; //点击大类时候把小类id清空
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }
  // 改变子类索引
  changeChildIndex(index, String id){
    // 传递两个参数，使用新传递的参数给状态赋值
    childIndex = index;
    subId = id;
    page = 1;
    noMoreText = '';
    notifyListeners();
  }

  //  一个增加page数量的方法，用来实现每次上拉加载后，page随后加  1 
  addPage () {
    page ++;
  }

  // 改变noMoreText 数据
  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
