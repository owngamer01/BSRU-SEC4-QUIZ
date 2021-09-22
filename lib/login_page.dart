import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/quiz_page.dart';

class User {
  static String name = "";
}

class LoginPage extends StatefulWidget {

  static const String page = "login";

  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usernameController = TextEditingController();

  void startQuiz() {
    User.name = usernameController.text;
    Navigator.pushNamed(context, QuizPage.page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 30
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // # รูปโลโก้
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 30
                ),
                child: Center(
                  child: Image.asset("images/logo.png")
                )
              ),

              // # กล่องอินพุท
              Text("กรุณากรอกชื่อของคุณ", style: GoogleFonts.prompt(
                fontSize: 16
              )),
              const SizedBox(height: 5),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "กรุณากรอกชื่อของคุณ",
                  hintStyle: GoogleFonts.prompt(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10)
                )
              ),

              const SizedBox(height: 20),

              // # ปุ่มกด
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: startQuiz,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xff400AB5))
                  ),
                  child: Text("เริ่มทำแบบทดสอบ", style: GoogleFonts.prompt(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16
                  ))
                ),
              )
              
            ]
          )
        )
      )
    );
  }
}