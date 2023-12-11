import 'package:flutter/material.dart';
import 'test.dart';
import 'package:url_launcher/url_launcher.dart';

class Resultpage extends StatelessWidget {
  List<Map<String, dynamic>> exp = [
    {},
    {

      "number":"1",
      "question": "APCS是甚麼?",
      "explain": "此題選:大學程式設計先修檢測",

    },
    {

      "number":"2",
      "question": "APCS有甚麼類型的題目",
      "explain": "此題選:實作題",

    },
    {

      "number":"3",
      "question": "APCS實作題滿分多少",
      "explain": "根據APCS網站：https://apcs.csie.ntnu.edu.tw/index.php/apcs-introduction/\n的介紹中提到，實作題的滿分分數為400",

    },
    {

      "number":"4",
      "question": "APCS英文全稱叫什麼",
      "explain": "根據APCS網站：https://apcs.csie.ntnu.edu.tw/index.php/apcs-introduction/\n的介紹中提到APCS的全稱是Advanced Placement Computer Science",

    },
    {

      "number":"5",
      "question": "APCS觀念題滿分多少",
      "explain": "根據APCS網站：https://apcs.csie.ntnu.edu.tw/index.php/apcs-introduction/\n的介紹中提到，實作題的滿分分數為400",

    },
    {

      "number":"6",
      "question": "給定上方程式片段，哪個n值不會造成超過 陣列 A 的選取範圍?",
      "explain": "此題選98",

    },
    {

      "number":"7",
      "question": "給定上方函式 f( ) ，當執行 f( 10 )時，最終回傳結果為何？",
      "explain": "此題選-3840",

    },
    {

      "number":"8",
      "question": "給定上方程式片段，for迴圈總共會執行幾次？",
      "explain": "此題選8",

    },
    {

      "number":"9",
      "question": "給定上方程式，若已知輸出的結果為[1][2][3][5][4][6]，程式中的_(?)_應為下列何者？",
      "explain": "此題為j<i",

    },
    {

      "number":"10",
      "question": "給定上方程式，當程式執行完後輸出結果為何?",
      "explain": "此題為1 2 3 4 5 6 7 8",

    },
  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('結果分析'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            Text('APCS了解狀況，答對：${typenum?['第一類型']}',style: TextStyle(
                fontSize: 20
            ),),
            Text('迴圈類型題目答對題數：${typenum?['第二類型']}',style: TextStyle(
                fontSize: 20
            ),),
            Text('第三類型題目答對數量：${typenum?['第三類型']}',style: TextStyle(
                fontSize: 20

            ),),

            Text('第一題是否答對：${explain?['1']}',style: TextStyle(
                fontSize: 20

            ),),
            Text('第二題是否答對：${explain?['2']}',style: TextStyle(
                fontSize: 20

            ),),
            Text('第三題是否答對：${explain?['3']}',style: TextStyle(
                fontSize: 20

            ),),
            Text('第四題是否答對：${explain?['4']}',style: TextStyle(
                fontSize: 20

            ),),
            Text('第五題是否答對：${explain?['5']}',style: TextStyle(
                fontSize: 20

            ),),
            Text('第六題是否答對：${explain?['6']}',style: TextStyle(
                fontSize: 20

            ),),
            Text('第七題是否答對：${explain?['7']}',style: TextStyle(
                fontSize: 20

            ),),
            Text('第八題是否答對：${explain?['8']}',style: TextStyle(
                fontSize: 20

            ),),
            Text('第九題是否答對：${explain?['9']}',style: TextStyle(
                fontSize: 20

            ),),
            Text('第十題是否答對：${explain?['10']}',style: TextStyle(
                fontSize: 20

            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('查看錯誤'),
                  onPressed: () {
                    for (int i = 10; i > 0; i--) {
    if (explain['$i'] == false) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('第 $i 題'),
                          contentPadding: EdgeInsets.all(16),
                          content: ConstrainedBox(
                          constraints: BoxConstraints(
                          maxWidth: 300,
                          maxHeight: 500,
                          ),
                          child: Center(
                          child: Column(
                          children: [
                                    Text("\n題目是：",style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    ),
                                    Text(exp[i]["question"]!),
                                    Text("\n題解：",style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    ),
                                    Text(exp[i]["explain"]!)
                                  ]
                              ),
                          ),
                          ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);

                                },
                                child: Text('確定'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    }
                  },

                ),
                ElevatedButton(
                  child: Text('重新開始'),
                  onPressed: () {
                    // 重新開始測驗

                    Navigator.pop(context);

                  },
                ),

              ],
            ),


          ],

        ),
      ),
    );
  }
}
