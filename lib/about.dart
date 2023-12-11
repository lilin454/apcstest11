import 'package:flutter/material.dart';

class Aboutpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APCS介紹'),
      ),
      body: Column(
        children:[
          Text('APCS介紹',style: TextStyle(
          fontSize: 40,
              fontWeight: FontWeight.bold),
          ),

          Text(
            'APCS 為Advanced Placement Computer Science 的英文縮寫\n\n是指「大學程式設計先修檢測」。\n\n其檢測模式乃參考美國大學先修課程（Advanced Placement，AP）， 與各大學合作命題，並確定檢定用題目經過信效度考驗，以確保檢定結果之公信力\n\n考試包含「程式設計觀念題」及「程式設計實作題」兩科目\n\n程式設計觀念題為選擇 題，分兩節考試，滿分100，程式設計實作題分一節考，滿分400\n\n兩科目採取自動評分與統計，評分過程不涉及主觀因素，會在電腦上考試。',
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ]
      ),
    );
  }
}