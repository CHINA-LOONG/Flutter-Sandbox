import 'package:flutter/material.dart';
import 'package:sandbox/pages/home_page.dart';
import 'package:sandbox/pages/login_page.dart';


class Routes {
  static const String initialRoute = RoutePath.tab;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.tab:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}

///路由地址
class RoutePath {
  //首页tab
  static const String tab = "/";

  //登录
  static const String login = "/login";

  //注册
  static const String register = "/register";

  //知识体系明细页面
  static const String knowledge_details = "/knowledge_details";

  //我的收藏页面
  static const String my_collects = "/my_collects";

  //显示网页资源的页面
  static const String web_view = "/web_view";

  //关于我们
  static const String about_us = "/about_us";

  //搜索页
  static const String search = "/search";
}



class RouteUtils {
  RouteUtils._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  // App 根节点Context
  static BuildContext get context => navigatorKey.currentContext!;

  static NavigatorState get navigator => navigatorKey.currentState!;

  /// 推送路由
  /// [routeName] 路由名称
  /// [arguments] 路由参数
  static void pushNamed(String routeName, {Object? arguments}) {
    navigator.pushNamed(routeName, arguments: arguments);
  }

  /// 推送路由并替换当前路由
  /// [routeName] 路由名称
  /// [arguments] 路由参数
  static void pushReplacementNamed(String routeName, {Object? arguments}) {
    navigator.pushReplacementNamed(routeName, arguments: arguments);
  }

  /// 推送路由并移除之前路由
  /// [routeName] 路由名称
  /// [arguments] 路由参数
  static void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    navigator.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// 弹出当前路由
  static void pop() {
    navigator.pop();
  }

  /// 弹出直到指定路由
  /// [routeName] 路由名称
  static void popUntil(String routeName) {
    navigator.popUntil((route) => route.settings.name == routeName);
  }
}


