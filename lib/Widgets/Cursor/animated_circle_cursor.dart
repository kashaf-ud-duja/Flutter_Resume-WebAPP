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
                  onHover: (event) => context
                      .read<AnimatedCursorProvidor>()
                      .updateCursorPosition(event.position),
                ),
              ),
              Visibility(
                visible: state.offset1 != Offset.zero,
                child: AnimatedPositioned(
                  //we can only use one at a time either top or bottom
                  //and same for left and right
                  top: state.offset1.dy - state.size1.height/2,
                  left: state.offset1.dx- state.size1.width/2,
                  width: state.size1.width,
                  height: state.size1.height,
                  duration: Duration(milliseconds: 100),
                  child: IgnorePointer(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOutExpo,
                      width: state.size1.width,
                      height: state.size1.height,
                      decoration: state.decoration ?? CursorConstants.boxdecorationOne ,
                    ),
                  ),
                ),
              ),
               Visibility(
                visible: state.offset2 != Offset.zero,
                child: AnimatedPositioned(
                  //we can only use one at a time either top or bottom
                  //and same for left and right
                  top: state.offset2.dy - state.size2.height/2,
                  left: state.offset2.dx- state.size2.width/2,
                  width: state.size2.width,
                  height: state.size2.height,
                  duration: Duration(milliseconds: 50),
                  child: IgnorePointer(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeOutExpo,
                      width: state.size2.width,
                      height: state.size2.height,
                      decoration: state.decoration ?? CursorConstants.boxdecorationTwo ,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}



class AnimatedCircleCursorMouseRegion extends StatefulWidget {
final Widget? child;



  const AnimatedCircleCursorMouseRegion({super.key, this.child});

  @override
  State<AnimatedCircleCursorMouseRegion> createState() => _AnimatedCircleCursorMouseOriginState();
}

class _AnimatedCircleCursorMouseOriginState extends State<AnimatedCircleCursorMouseRegion> {
final GlobalKey _key = GlobalKey();


  @override
  Widget build(BuildContext context) {
final cubit = context.read<AnimatedCursorProvidor>();

    return MouseRegion(
      key: _key,
      cursor: SystemMouseCursors.click,
      opaque: false,
      onHover:(_) =>  cubit.changeCursor(key: _key, BoxDecoration: CursorConstants.boxdecorationhovered),
      onExit: (event) => cubit.resetCursor(),
      child: widget.child,
    );
  }
}
