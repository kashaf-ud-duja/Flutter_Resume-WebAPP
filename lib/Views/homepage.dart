import 'package:cv/Widgets/Cursor/animated_circle_cursor.dart';
import 'package:cv/Widgets/Icons/padded_icons.dart';
import 'package:cv/Widgets/Buttons/gradient_button_container.dart';
import 'package:cv/Widgets/Text/poppins.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 250, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedCircleCursorMouseRegion(
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        "assets/images/4.png",
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      PaddedIcons(
                        clr: const Color.fromRGBO(13, 71, 161, 1),
                        ficon: FontAwesomeIcons.facebookF,
                        padding: null,
                        iconsize: null,
                      ),
                      PaddedIcons(
                        clr: Colors.pink,
                        ficon: FontAwesomeIcons.instagram,
                        padding: null,
                        iconsize: null,
                      ),
                      PaddedIcons(
                        clr: const Color.fromRGBO(25, 118, 210, 1),
                        ficon: FontAwesomeIcons.linkedin,
                        padding: null,
                        iconsize: null,
                      ),
                      PaddedIcons(
                        clr: Colors.black,
                        ficon: FontAwesomeIcons.github,
                        padding: null,
                        iconsize: null,
                      ),
                      PaddedIcons(
                        clr: const Color.fromRGBO(97, 97, 97, 1),
                        ficon: Icons.mail,
                        padding: null,
                        iconsize: 26,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GradientButtonContainer(
                        Overlayclr: const Color.fromRGBO(13, 71, 161, 1),
                        Title: 'Download Resume',
                        clr: [
                          Color(0xFF00203F),
                          const Color.fromRGBO(26, 35, 126, 1)
                        ],
                        isgradientvertical: true,
                        onpressed: () {},
                        width: 250,
                        height: 80,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 500,
                        child: Column(
                          children: [
                            Poppins(
                              text: "I'm",
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            Poppins(
                              text: 'Kashaf ud duja',
                              color: Colors.black,
                              fontSize: 100,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 500,
                        color: Colors.black,
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
