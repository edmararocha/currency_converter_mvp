import 'package:currency_coverter_mvp/app/mvp/features/home_view.dart';
import 'package:currency_coverter_mvp/app/mvp/features/login_view.dart';
import 'package:flutter/material.dart';

main () {
  runApp(AppWdidget()); 
}

class AppWdidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black, 
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black, ),
      ),
      
      initialRoute: '/',

      routes: {
        '/': (context) => LoginView(),
        '/home': (context) => HomeView(),
      } 
    );
  }
}