import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/finish_page.dart';
import 'package:quiz/login_page.dart';
import 'package:quiz/quiz_page.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,

      ),
      initialRoute: LoginPage.page,
      routes: {
        LoginPage.page: (_) => const LoginPage(),
        QuizPage.page: (_) => const QuizPage()
      },
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case FinishPage.page:
            final data = setting.arguments as List<int>;
            return MaterialPageRoute(builder: (_) => FinishPage(
              min: data.first,
              max: data.last,
            ));
          default:
        }
      },
    );
  }
}
