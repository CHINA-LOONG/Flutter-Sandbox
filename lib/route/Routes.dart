import 'package:flutter/material.dart';
import 'package:sandbox/pages/home_page.dart';

import '../common/helper.dart';
import '../pages/login_page.dart';


final _ROUTES_ = Helper.typeNameMap({
  HomePage: (context) => HomePage(),
  LoginPage: (context) => LoginPage(),
});

final class MyRouter {
  MyRouter._();

  Object? _arguments;
  String? _routeName;
  BuildContext? _context;

  static final MyRouter _instance = MyRouter._();

  static final String FIRST = Helper.typeName(LoginPage);

  static final ROUTES = _ROUTES_;

  void _resetVariables() {
    _arguments = null;
    _routeName = null;
    _context = null;
  }

  static RT of<RT extends RouterBridge>(BuildContext context) {
    assert(RT != RouterBridge<dynamic>, "RT must be a subtype of RouterBridge");
    final name = Helper.typeName(RT);
    assert(hasName(name), "Route $name not found");
    _instance._context = context;
    _instance._routeName = name;
    var builder = ROUTES[name]!;
    return builder.call(context) as RT;
  }

  Future<T?> to<T extends Object?>() {
    assert(_context != null, "Context is null");
    assert(_routeName != null, "Route name is null");
    return Navigator.pushNamed<T>(
      _context!,
      _routeName!,
      arguments: _arguments,
    ).whenComplete(_resetVariables);
  }

  static MyRouter _withArguments(dynamic arguments) {
    _instance._arguments = arguments;
    return _instance;
  }

  static bool hasName(String name) => ROUTES.containsKey(name);

  static bool hasRoute(Type type) => ROUTES.containsKey(Helper.typeName(type));
}

extension Context on BuildContext {
  Future<T?> routeTo<T extends Object?>(Type route) {
    return Navigator.pushNamed(this, Helper.typeName(route));
  }

  RT routeOf<RT extends RouterBridge>() {
    assert(RT != RouterBridge<dynamic>, "RT must be a subtype of RouterBridge");
    return MyRouter.of<RT>(this);
  }
}

mixin RouterBridge<RT_ARG_TYPE> {
  MyRouter arguments(RT_ARG_TYPE arguments) =>
      MyRouter._withArguments(arguments);

  RT_ARG_TYPE? argumentOf(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;
    return arguments == null ? null : arguments as RT_ARG_TYPE?;
  }
}
