import 'package:flutter/material.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 250,vertical: 30),
        child: Column(children: [
          Row(
            children: [
              
            ],
          )
        ],),
      )
    );
  }
}