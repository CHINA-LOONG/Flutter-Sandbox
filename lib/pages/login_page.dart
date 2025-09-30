import 'package:flutter/material.dart';
import 'package:sandbox/pages/home_page.dart';
import 'package:sandbox/route/Routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.routeOf<HomePage>().arguments("测试数据传输").to(),
      child: Text("登录"),
    );
  }
}
