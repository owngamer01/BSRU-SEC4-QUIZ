import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/login_page.dart';

class FinishPage extends StatelessWidget {

  static const String page = "finish";
  final int max, min;

  const FinishPage({ 
    Key? key,
    required this.max,
    required this.min
  }) : super(key: key);


  void toHomeScreen(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName(LoginPage.page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text("QuizApp", style: GoogleFonts.prompt()),
      ),
      body: Column(
        children: [
          // # รูปภาพ
          SizedBox(
            width: double.infinity,
            child: Image.asset("images/finish.png", fit: BoxFit.cover)
          ),

          // # ข้อความ
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text("คุณ ${User.name} ได้คะแนนยอดเยี่ยมมาก", style: GoogleFonts.prompt(
              fontSize: 20
            )),
          ),

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
              child: Text("$min / $max", style: GoogleFonts.prompt(
                color: Colors.white,
                fontSize: 20
              )),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                toHomeScreen(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)
              ),
              child: Text("กลับหน้าแรก", style: GoogleFonts.prompt(
                color: Colors.white
              ))
            )
          )
        ]
      )
    );
  }
}