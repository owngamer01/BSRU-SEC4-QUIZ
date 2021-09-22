import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/finish_page.dart';

class QuizPage extends StatefulWidget {

  static const String page = "quiz";

  const QuizPage({ Key? key }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int currentState = 0, currentPage = 0;

  List<Map<String, dynamic>> selectData = [];
  List<Map<String, dynamic>> quizData = [{
    "quiz_id": 1,
    "title": "สัตว์อะไรไม่มีขา",
    "image": "images/quiz_01.png",
    "answer": 2,
    "choice": [{
      "text": "หมา",
      "value": 0
    }, {
      "text": "แมว",
      "value": 1
    }, {
      "text": "ปลา",
      "value": 2
    }, {
      "text": "หมี",
      "value": 3
    }]
  }, {
    "quiz_id": 2,
    "title": "สัตว์อะไรบินได้",
    "image": "images/quiz_02.png",
    "answer": 0,
    "choice": [{
      "text": "นก",
      "value": 0
    }, {
      "text": "แมว",
      "value": 1
    }, {
      "text": "ปลา",
      "value": 2
    }, {
      "text": "หมี",
      "value": 3
    }]
  }];

  void onStateChange(int? index) {
    setState(() {
      currentState = index!;
    });
  }

  void nextState() {
    selectData.add({
      "quiz_id": quizData[currentPage]["quiz_id"],
      "value": quizData[currentPage]["choice"][currentState]["value"]
    });

    if (currentPage >= quizData.length - 1) {

      int answer = 0;
      for (var i = 0; i < quizData.length; i++) {
        int findIndexAnswer = selectData.indexWhere((select) {
          return quizData[i]["answer"] == select["value"] && quizData[i]["quiz_id"] == select["quiz_id"];
        });

        if (findIndexAnswer != -1) {
          answer += 1;
        }
      }

      Navigator.pushNamed(context, FinishPage.page, arguments: [answer, quizData.length]);
      return;
    }

    setState(() {
      currentPage += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final data = quizData[currentPage];

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text("QuizApp", style: GoogleFonts.prompt()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // # กล่องคะแนน
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 30
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff109EA7),
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Text("1 / 2", style: GoogleFonts.prompt(
                  color: Colors.white
                )),
              ),
            ),

            // # หัวข้อ Quiz
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(data["title"], style: GoogleFonts.prompt()),
            ),
            Container(
              width: double.infinity,
              color: Colors.red,
              child: Image.asset(data["image"], fit: BoxFit.cover)
            ),
            
            // # ช้อย Quiz
            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: RadioListTile<int>(
                      value: data["choice"][0]["value"],
                      groupValue: currentState,
                      title: Text(data["choice"][0]["text"], style: GoogleFonts.prompt()),
                      onChanged: onStateChange,
                    )),
                    Expanded(child: RadioListTile<int>(
                      value: data["choice"][1]["value"],
                      groupValue: currentState,
                      title: Text(data["choice"][1]["text"], style: GoogleFonts.prompt()),
                      onChanged: onStateChange,
                    )),
                  ]
                ),
                Row(
                  children: [
                    Expanded(child: RadioListTile<int>(
                      value: data["choice"][2]["value"],
                      groupValue: currentState,
                      title: Text(data["choice"][2]["text"], style: GoogleFonts.prompt()),
                      onChanged: onStateChange,
                    )),
                    Expanded(child: RadioListTile<int>(
                      value: data["choice"][3]["value"],
                      groupValue: currentState,
                      title: Text(data["choice"][3]["text"], style: GoogleFonts.prompt()),
                      onChanged: onStateChange,
                    )),
                  ]
                )
              ]
            ),

            // ปุ่มถัดไป
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xff400AB5))
                ),
                onPressed: nextState, 
                child: Text("ถัดไป", style: GoogleFonts.prompt(
                  color: Colors.white
                ))
              ),
            )

          ]
        ),
      ),
    );
  }
}