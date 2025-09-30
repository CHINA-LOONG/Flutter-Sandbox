import 'package:flutter/material.dart';
import 'package:sandbox/route/Routes.dart';

class HomePage extends StatefulWidget with RouterBridge<String> {
  const HomePage({super.key /*, required this.title*/});

  // final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String? title = widget.argumentOf(context);
    return Text(title ?? "为获取到参数");
  }
}
