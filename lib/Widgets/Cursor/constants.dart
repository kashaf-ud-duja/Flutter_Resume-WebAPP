import 'package:flutter/material.dart';

class CursorConstants {
  static BoxDecoration boxdecorationhovered = BoxDecoration(
    border: Border.all(color: Colors.transparent),
    // we can choose either one of the option, through shape or through borderradius, here we have selected through border radius
    // shape: BoxShape.circle,
    borderRadius: BorderRadius.all(
      Radius.circular(90),
    ),
    color: Colors.blue[900]!.withOpacity(0.3)
  );
}
