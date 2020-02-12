import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import './provide/details_info.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';

void main() {
  var counter = Counter();
  var childCategory = ChildCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var detailsInfoProvide = DetailsInfoProvide();

  var providers = Providers();
  providers
  ..provide(Provider<Counter>.value(counter))
  ..provide(Provider<ChildCategory>.value(childCategory))
  ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
  ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide));
  

  runApp(ProviderNode(child: MyApp(), providers: providers,));
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
     
     final router = Router();
     Routes.configureRoutes(router);
     Application.router = router;


    // 使用Container 作为根widget是为了 更好扩展 padding/margin
    return Container(
        child: MaterialApp(
          title: '商城学习',
          debugShowCheckedModeBanner: false,
          // 注入全局的路由
          onGenerateRoute: Application.router.generator,
          theme: ThemeData(
            primaryColor: Colors.pink
          ),
          home: IndexPage(),
        ),
    );
  }
}