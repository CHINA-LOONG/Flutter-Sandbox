import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sandbox/common/helper.dart';
import 'package:sandbox/common/language_provider.dart';
import 'package:sandbox/generated/l10n.dart';
import 'package:sandbox/pages/home_page.dart';
import 'package:sandbox/pages/login_page.dart';
import 'package:sandbox/pages/test_page.dart';
import 'package:sandbox/responsive.dart';
import 'package:sandbox/route/RouteUtils.dart';
import 'package:sandbox/route/Routes.dart';
import 'package:sandbox/type/data_type.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 这个widget是你的应用程序的根widget
  @override
  Widget build(BuildContext context) {
    // List<DisplayFeature> list = MediaQuery.displayFeaturesOf(context);
    // ScreenUtil.init(context);
    // if(list.isNotEmpty){
    //   print("${list[0]}   屏幕状态");
    //   print("${MediaQuery.of(context).size} 屏幕大小");
    // }
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: LanguageProvider().init().locale,
      theme: ThemeData(
        // 这是你的应用程序的主题
        //
        // 尝试这个：运行你的应用程序 "flutter run"。你会看到
        // 应用程序有一个紫色的工具栏。然后，在不退出应用程序的情况下，
        // 尝试将下面的colorScheme中的seedColor改为Colors.green
        // 然后调用"热重载"（保存更改或在支持Flutter的IDE中按"热重载"按钮，
        // 或者如果你使用命令行启动应用程序，按"r"键）。
        //
        // 注意计数器没有重置为零；应用程序状态在重载过程中不会丢失。
        // 要重置状态，请使用热重启。
        //
        // 这对代码也有效，不仅仅是值：大多数代码更改都可以通过热重载来测试。
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MyHomePage(title: "S.current.hello_world"),
      // home: TestPage(),
      // home: HomePage(title: S.current.app_name),
      // routes: {"/login": (context) => LoginPage()},
      // navigatorKey: RouteUtils.navigatorKey,
      // onGenerateRoute: Routes.generateRoute,
      // initialRoute: Routes.initialRoute,

      // routes: Helper.typeNameMap({
      //   HomePage: (context) => HomePage(title: S.current.app_name),
      //   LoginPage: (context) => LoginPage(),
      //   TestPage: (context) => TestPage(),
      // }),
      routes: MyRouter.ROUTES,
      initialRoute: MyRouter.FIRST,
      // home: Column(
      //   children: [
      //     Responsive(
      //       mobile: Text("手机"),
      //       tablet: Text("平板模式"),
      //       desktop: Text("桌面模式"),
      //     ),
      //     Container(
      //       width: 100,
      //       height: 100,
      //       decoration: BoxDecoration(color: Colors.red),
      //     ),
      //     Container(
      //       width: 100,
      //       height: 100,
      //       decoration: BoxDecoration(color: Colors.red),
      //     ),
      //   ],
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // 这个widget是你的应用程序的主页。它是一个有状态的widget，意味着
  // 它有一个State对象（下面定义），其中包含影响其外观的字段。

  // 这个类是状态的配置。它保存父级（在这个例子中是App widget）提供的值
  // （在这个例子中是标题），并被State的build方法使用。
  // Widget子类中的字段总是标记为"final"。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 这个setState调用告诉Flutter框架这个State中有东西发生了变化，
      // 这导致它重新运行下面的build方法，以便显示可以反映更新后的值。
      // 如果我们更改_counter而不调用setState()，那么build方法将不会被
      // 再次调用，因此看起来什么也没有发生。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 这个方法在每次调用setState时重新运行，例如上面_incrementCounter方法所做的那样。
    //
    // Flutter框架已经优化了重新运行build方法的速度，
    // 这样你可以只重建需要更新的部分，而不必单独更改widget实例。
    return Scaffold(
      appBar: AppBar(
        // 尝试这个：尝试将这里的颜色改为特定颜色（比如Colors.amber？）
        // 并触发热重载，以查看AppBar改变颜色而其他颜色保持不变。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // 这里我们获取由App.build方法创建的MyHomePage对象的值，
        // 并用它来设置我们的appbar标题。
        title: Text(widget.title),
      ),
      body: Center(
        // Center是一个布局widget。它接受一个子widget并将其定位在父级的中间。
        child: Column(
          // Column也是一个布局widget。它接受一个子widget列表并将它们垂直排列。
          // 默认情况下，它会调整自身大小以适应其子widget的水平尺寸，
          // 并尝试与其父级一样高。
          //
          // Column有各种属性来控制它如何调整自身大小以及如何定位其子widget。
          // 这里我们使用mainAxisAlignment来垂直居中子widget；
          // 这里的主轴是垂直轴，因为Column是垂直的（交叉轴将是水平的）。
          //
          // 尝试这个：调用"debug painting"（在IDE中选择"Toggle Debug Paint"操作，
          // 或在控制台中按"p"键），以查看每个widget的线框。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            ElevatedButton(
              onPressed: () {
                debugPrint("切换中文");
                setState(() {
                  S.load(
                    Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
                  );
                });
              },
              child: Text(S.of(context).hello_world),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint("切换英文");
                setState(() {
                  S.load(Locale.fromSubtags(languageCode: 'en'));
                });
              },
              child: Text(S.current.hello_world),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // 这个尾随逗号使build方法的自动格式化更美观。
    );
  }
}
