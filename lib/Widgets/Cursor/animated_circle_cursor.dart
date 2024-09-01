import 'package:cv/Widgets/Cursor/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AnimatedCursorState {
  final BoxDecoration? decoration;
  // offset tells the position of the cursor
  final Offset offset1;
  final Offset offset2;
  final Size size1;
  final Size size2;

  AnimatedCursorState({
    this.decoration,
    this.offset1 = Offset.zero,
    this.offset2 = Offset.zero,
    this.size1 = circle1Size,
    this.size2 = circle2Size2,
  });

  static const Size circle1Size = Size(30, 30);
  static const Size circle2Size2 = Size(5, 5);
}

class AnimatedCursorProvidor extends ChangeNotifier {
  AnimatedCursorProvidor();
  AnimatedCursorState state = AnimatedCursorState();
  void changeCursor(
      {required GlobalKey key, required BoxDecoration BoxDecoration}) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox;
    if (renderBox == null) {
      return;
    } else {
      state = AnimatedCursorState(
          size1: Size(60, 60),
          offset1: state.offset1,
          decoration: CursorConstants.boxdecorationhovered);
      notifyListeners();
    }
  }

  void resetCursor() {
    state = AnimatedCursorState();
    notifyListeners();
  }

  void updateCursorPosition(Offset position) {
    state = AnimatedCursorState(offset1: position, offset2: position);
    notifyListeners();
  }
}

class AnimatedCircleCursor extends StatelessWidget {
  const AnimatedCircleCursor({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimatedCursorProvidor(),
      child: Consumer<AnimatedCursorProvidor>(
        child: child,
        builder: (context, value, child) {
          final state = value.state;
          return Stack(
            children: [
              child != null ? child : Container(),
              Positioned.fill(
                child: MouseRegion(
                  opaque: false,
                  onHover: (event) => context.read<AnimatedCursorProvidor>().updateCursorPosition(event.position),
                ),
              ),
              
            ],
          );
        },
      ),
    );
  }
}
