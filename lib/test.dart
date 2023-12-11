import 'dart:math';
import 'package:flutter/material.dart';
import 'result.dart';
bool isFinished = false;
void test() {
  runApp(MyTest());

}

class MyTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APCS練習',
      initialRoute: '/',
      routes: {
        '/result': (context) => Resultpage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestPage(),
    );
  }
}


Map<String, int> typenum = {
  '第一類型': 0,
  '第二類型': 0,
  '第三類型': 0,
};
Map<String, bool> explain = {
  '1': false,
  '2': false,
  '3': false,
  '4': false,
  '5': false,
  '6': false,
  '7': false,
  '8': false,
  '9': false,
  '10': false,
  //...
};

class TestPage extends StatefulWidget{
  @override
  _TestPageState createState() => _TestPageState();

}
class _TestPageState extends State<TestPage> {

  List<Map<String, dynamic>> questions = [
    {
      "question": "APCS是甚麼?",
      "options": [
        "大學程式設計先修檢測",
        "大學室內設計先修檢測",
        "高中程式設計先修檢測",
        "高中室內設計先修檢測"
      ],
      "answer": "大學程式設計先修檢測",
      "image": "assets/tt/baner.jpg",
      "type": "1",
      "number":"1"
    },

    {
      "question": "APCS有甚麼類型的題目",
      "options": ["多選題", "實作題", "申論題", "配對題"],
      "answer": "實作題",
      "image": "assets/tt/baner.jpg",
      "type": "1",
      "number" : "2"
    },
    {
      "question": "APCS實作題滿分多少",
      "options": ["400", "1000", "10", "5"],
      "answer": "400",
      "image": "assets/tt/baner.jpg",
      "type": "1",
      "number" :"3"
    },
    {
      "question": "APCS英文全稱叫什麼",
      "options": [
        "Apple pencil cat snake",
        "Advanced Placement Computer Science",
        "AP Computer Science",
        "A-Level Computer Science"
      ],
      "answer": "Advanced Placement Computer Science",
      "image": "assets/tt/baner.jpg",
      "type": "1",
      "number" :"4"
    },
    {
      "question": "APCS觀念題滿分多少",
      "options": ["1000", "10", "5", "100"],
      "answer": "100",
      "image": "assets/tt/baner.jpg",
      "type": "1",
      "number" :"5"
    },
    {
      "question": "給定上方程式片段，哪個n值不會造成超過 陣列 A 的選取範圍?",
      "options": ["69", "89", "98", "202"],
      "answer": "98",
      "image": "assets/tt/apcs01.png",
      "type": "2",
    "number" :"6"
    },
    {
      "question": "給定上方函式 f( ) ，當執行 f( 10 )時，最終回傳結果為何？",
      "options": ["1", "3840", "-3840", "執行時導致無窮迴圈，不會停止執行"],
      "answer": "-3840",
      "image": "assets/tt/t2.png",
      "type": "2",
    "number" :"7"
    },
    {
      "question": "給定上方程式片段，for迴圈總共會執行幾次？",
      "options": ["8", "32", "64", "128"],
      "answer": "8",
      "image": "assets/tt/t3.png",
      "type": "2",
      "number" :"8"
    },
    {
      "question": "給定上方程式，若已知輸出的結果為[1][2][3][5][4][6]，程式中的_(?)_應為下列何者？",
      "options": ["j<i", "j>i", "j<=i", "j>=i"],
      "answer": "j<i",
      "image": "assets/tt/t4.png",
      "type": "2",
    "number" :"9"
    },
    {
      "question": "給定上方程式，當程式執行完後輸出結果為何?",
      "options": ["1 2 3 4 5 6 7 8", "7 5 3 1 2 4 6 8", "7 5 3 2 1 4 8 6", "8 7 6 5 4 3 2 1"],
      "answer": "1 2 3 4 5 6 7 8",
      "image": "assets/tt/t5.png",
      "type": "2",
      "number" :"10"
    },

  ];




  List<int> usequestionIndices = [];
  int _currentQuestion = 0;
  int _correctCount = 0;
  int que = 0;
  int type1 =0;
  int type2 =0;
  int type3 =0;



  @override
  void initState() {
    super.initState();
    _generateRandomQuestionIndex();
  }

  void _generateRandomQuestionIndex() {
    var random = Random();
    int randomIndex = random.nextInt(questions.length);
    while (usequestionIndices.contains(randomIndex)) {
      randomIndex = random.nextInt(questions.length);
    }
    usequestionIndices.add(randomIndex); // 先將 randomIndex 添加到列表中
    setState(() {
      _currentQuestion = randomIndex; // 然後再更新 _currentQuestion 的值
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APCS練習'),
      ),
      body: _buildQuestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          que = 0;
          isFinished = false;
          explain.update('1', (value) => false);
          explain.update('2', (value) => false);
          explain.update('3', (value) => false);
          explain.update('4', (value) => false);
          explain.update('5', (value) => false);
          explain.update('6', (value) => false);
          explain.update('7', (value) => false);
          explain.update('8', (value) => false);
          explain.update('9', (value) => false);
          explain.update('10', (value) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(

              content: Text('重新整理'),
              duration: Duration(seconds: 2),

            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) => TestPage()),
          );
        },
        child: Icon(Icons.replay),
      ),
    );
  }

  Widget _buildQuestions() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(questions[_currentQuestion]["image"],width: 300,height: 300, ),
            ListTile(
              title: Text(
                questions[_currentQuestion]["question"]!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Column(
              children: _buildOptions(questions[_currentQuestion]["options"]!),
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }

  List<Widget> _buildOptions(List<dynamic> options) {
    return options.map<Widget>((option) {
      return ListTile(
        title: Text(option),
        subtitle: _buildAnswerButton(option),
      );
    }).toList();
  }

  Widget _buildAnswerButton(String answer) {
    return ElevatedButton(
      child: Text('選擇'),
      onPressed: () {
        if(isFinished) {
          _showSubmitDialog();
          return;
        }

        setState(() {
          que++;
        });

        if (answer == questions[_currentQuestion]["answer"]) {
          setState(() {
            _correctCount++;
          });

        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["type"] == "1"){
          setState(() {
           type1++;
          });
        }
          if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["type"] == "2"){
            setState(() {
              type2++;
            });
        }
          if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["type"] == "3"){
            setState(() {
              type3++;
            });
          }
          //答案匹對
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "1"){
          setState(() {
            explain.update('1', (value) => true);

          });
        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "2"){
          setState(() {
            explain.update('2', (value) => true);
          });
        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "3"){
          setState(() {
            explain.update('3', (value) => true);
          });
        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "4"){
          setState(() {
            explain.update('4', (value) => true);
          });
        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "5"){
          setState(() {
            explain.update('5', (value) => true);
          });
        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "6"){
          setState(() {
            explain.update('6', (value) => true);
          });
        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "7"){
          setState(() {
            explain.update('7', (value) => true);
          });
        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "8"){
          setState(() {
            explain.update('8', (value) => true);
          });
        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "9"){
          setState(() {
            explain.update('9', (value) => true);
          });
        }
        if(answer == questions[_currentQuestion]["answer"] && questions[_currentQuestion]["number"] == "10"){
          setState(() {
            explain.update('10', (value) => true);
          });
        }
        if (usequestionIndices.length < questions.length) {
          _generateRandomQuestionIndex();
        }
        if (que == 10){
          _showSubmitDialog();

        }

      },
    );
  }

  void _showSubmitDialog() {
    setState(() {
      isFinished = true;
    });
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: Text('測驗結果'),
          content: Text('您答對了 $_correctCount 題'),

          actions: [
            TextButton(
              child: Text('確定'),
              onPressed: () {

                Navigator.of(context).pop();

              },
            ),
            TextButton(
              child: Text('結果'),
              onPressed: () {
                typenum.update('第一類型', (value) => type1);
                typenum.update('第二類型', (value) => type2);
                typenum.update('第三類型', (value) => type3);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultpage(),
                    settings: RouteSettings(arguments: ScreenArguments(explain,typenum)),
                  ),
                );
              },
            ),
          ],
        );
      },
    );

  }

}

class ScreenArguments {



  ScreenArguments(explain,typenum);

}