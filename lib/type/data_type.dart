import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  const DataType({super.key});

  @override
  State<DataType> createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    print("测试是否进行了重构");
    _numType();
    return Container(child: Text("数字类型"));
  }

  /// 数字类型
  void _numType() {
    num a = 1;
    int b = 1;
    double c = 1.0;
    // print(a);
    // print(b);
    // print(c);
    print("a:$a,b:$b,c:$c");
  }
}
