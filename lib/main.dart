import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sandbox/app.dart';
import 'package:sandbox/common/language_provider.dart';
import 'package:sandbox/common/local_storages.dart';

void main() async {
  //runApp前调用，初始化绑定，手势、渲染、服务等
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorages.ensureInitialized();
  // await ScreenUtil.ensureScreenSize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        // ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: Consumer(
        builder: (context, languageProvider, widget) {
          return MyApp();
        },
      ),
    ),
  );
}
