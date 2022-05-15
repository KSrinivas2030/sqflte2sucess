import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: Text("HOME"),
     ),
      body: Center(
        child: Text('WELCOME TO MY HOMEPAGE'),
      ),
    );
  }
}
