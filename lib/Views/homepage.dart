import 'package:cv/Widgets/gradient_button_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 250, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      "assets/images/4.png",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.blue[900],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.pink,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(FontAwesomeIcons.github),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.mail,
                          color: Color(0XFF1A9CE2),
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GradientButtonContainer(
                        Overlayclr: Colors.teal,
                        Title: 'Download Resume',
                        clr: [
                          Color(0xFF00203F),
                           const Color.fromRGBO(13, 71, 161, 1)
                        ],
                        isgradientvertical: true,
                        onpressed: () {},
                        width: 250,
                        height: 80,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
