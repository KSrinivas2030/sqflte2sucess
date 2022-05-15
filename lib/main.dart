import 'package:flutter/material.dart';
import 'package:sqflite_mvp_sqlite/pages/login/home_page.dart';
import 'package:sqflite_mvp_sqlite/pages/login/login_page.dart';
void main()=>runApp(
    Myapp(
  
));

final routes = {
  '/login':(BuildContext context)=> Loginpage(),
  '/home':(BuildContext context)=> const Homepage(),
  '/':(BuildContext context)=> Loginpage(),
};
class Myapp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SQFLITE",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}
