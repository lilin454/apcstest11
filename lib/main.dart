import 'package:apcstest1/about.dart';
import 'package:apcstest1/intro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'result.dart';
// ignore: depend_on_referenced_packages
// 引入 Material 套件，提供 Material Design 的基礎元件
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// 引入 Font Awesome 套件，提供豐富的圖示
// ignore: depend_on_referenced_packages
import 'package:transparent_image/transparent_image.dart';
// 引入 TransparentImage 套件，可用來顯示漸進式圖片
import 'test.dart';
import 'intro.dart';
import 'about.dart';

void main() => runApp(MyApp());
// 程式進入點，建立 MyApp 物件並執行
class MyApp extends StatelessWidget {
  // 無狀態元件，用來建立應用程式的主視圖
  @override
  Widget build(BuildContext context) {
    // 建立 MaterialApp 物件，設定應用程式的標題、主題、首頁等
    return MaterialApp(

      title: 'APCS觀念題Test',
      initialRoute: '/',

      //'***名稱***': (context) => const ***頁面 Widget 名稱***
      routes: {
        '/test': (context) => TestPage(),
        '/intro': (context) => Intropage(),
        '/about': (context) => Aboutpage(),
        '/result': (context) => Resultpage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // 有狀態元件，用來建立應用程式的首頁
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //  有狀態元件的狀態類別，用來管理應用程式的狀態
  @override
  Widget build(BuildContext context) {
    //建立 Scaffold 元件，作為應用程式的主結構
    return Scaffold(
      appBar: AppBar(
        // 設定 AppBar 的標題
        title: Text("APCS練習"),

      ),
      backgroundColor: Color(int.parse("0xFFF4F4F4")),
      body:SingleChildScrollView(
      child:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/APCS.png'),
            IconButton(
              icon: Image.asset('assets/buttom2.png'),
              iconSize: 250,
              onPressed: () {
                Navigator.pushNamed(context, '/test');
              },
            ),
          ],
        ),
      ),
      ),
        floatingActionButton: FloatingActionButton(
        // 設定 FloatingActionButton 的圖示
        child:
        Icon(Icons.play_arrow),

        // 點擊 FloatingActionButton 時執行的動作
        onPressed: () {
          // 關閉側滑抽屜

          // 跳轉到測試頁面
          Navigator.pushNamed(context, '/test');
        },
      ),
      drawer: Drawer(
        // 設定 Drawer 的內容
        child: ListView(
          children: <Widget>[
            // Drawer 的頭部
            UserAccountsDrawerHeader(
              accountName: Text('APCS'),
              accountEmail: Text('morgan12907484@gmail.com'),
              currentAccountPicture: Image.asset('assets/APCS.png'),
              decoration: BoxDecoration(color: Colors.indigo),
            ),
            // Drawer 的項目
            ListTile(
              leading: Icon(Icons.youtube_searched_for),
              title: Text('開始測試'),
              onTap: () {
                // 關閉側滑抽屜
                Navigator.pop(context);
                // 跳轉到測試頁面
                Navigator.pushNamed(context, '/test');
              },
            ),
            ListTile(
              leading: Icon(Icons.view_timeline),
              title: Text('觀念與實作題介紹'),
              onTap: () {
                // 關閉側滑抽屜
                Navigator.pop(context);
                // 跳轉到觀念與實作題介紹頁面
                Navigator.pushNamed(context, '/intro');
              },
            ),
            ListTile(
              leading: Icon(Icons.help_center),
              title: Text('APCS介紹'),
              onTap: () {
                // 關閉側滑抽屜
                Navigator.pop(context);
                // 跳轉到APCS介紹頁面
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}