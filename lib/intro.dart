import 'package:flutter/material.dart';

class Intropage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('觀念與實作介紹'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Text(
          '程式設計觀念題 兩份測驗題本共計40 個試題，分兩節次施測\n程式設計實作題 一份測驗題本共計4 個題組',
          style: TextStyle(
              fontSize: 20
          ),
      ),
            Image.asset('assets/introtest.png'),
          ],
        ),
      ),
    );
  }
}