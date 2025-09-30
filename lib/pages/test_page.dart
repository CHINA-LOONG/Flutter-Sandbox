import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Text("屏幕大小: $size");
  }
}


// class TestPage extends StatefulWidget {
//   const TestPage({super.key});
//
//   @override
//   State<TestPage> createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//   @override
//   Widget build(BuildContext context) {
//
//
//     var size = MediaQuery.of(context).size;
//
//     return Text("屏幕大小: $size");
//   }
// }

