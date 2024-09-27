import 'package:cv/Widgets/Cursor/animated_circle_cursor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PaddedIcons extends StatelessWidget {
final IconData ficon;
final double? padding;
final Color clr;
final double? iconsize;

PaddedIcons({
  required this.clr,
  required this.ficon,
  required this.padding,
  required this.iconsize
});
  @override
  Widget build(BuildContext context) {
    return AnimatedCircleCursorMouseRegion(
      child: Padding(
        padding: padding != null ? EdgeInsets.all(padding!):  EdgeInsets.all(10.0),
        child: Icon(
          ficon,
          color: clr,
          size: iconsize != null ? iconsize : 22,
        ),
      ),
    );
  }
}