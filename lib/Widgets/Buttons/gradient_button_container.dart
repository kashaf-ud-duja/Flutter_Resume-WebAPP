import 'package:cv/Widgets/Cursor/animated_circle_cursor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButtonContainer extends StatelessWidget {
  final double width;
  final double height;
  final String Title;
  final List<Color> clr;
  final Color Overlayclr;
  final bool isgradientvertical;
  final Function() onpressed;
  GradientButtonContainer({
    required this.Title,
    required this.Overlayclr,
    required this.clr,
    required this.isgradientvertical,
    required this.onpressed,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCircleCursorMouseRegion(
      child: Container(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: isgradientvertical
                      ? Alignment.topCenter
                      : Alignment.centerLeft,
                  end: isgradientvertical
                      ? Alignment.bottomCenter
                      : Alignment.centerRight,
                  colors: clr,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: WidgetStateProperty.all<double>(0),
                    //overlay color is the color that will dispalyed once hover on the button.
      
                    overlayColor: WidgetStateProperty.all<Color>(Overlayclr),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(0)),
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.transparent)),
                onPressed: onpressed,
                child:
                    Text(
                      Title,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
