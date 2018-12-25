import 'package:flutter/widgets.dart';

class Stick extends StatelessWidget {
  final VoidCallback onLeft;
  final VoidCallback onRight;
  final VoidCallback onUp;
  final VoidCallback onDown;

  Stick({this.onLeft, this.onRight, this.onUp, this.onDown});

  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragEnd: onHorizontal,
      onVerticalDragEnd: onVertical,
    );
  }

  void onHorizontal(DragEndDetails e) {
    if (e.primaryVelocity > 0 && onRight != null) {
      onRight();
    }
    if (e.primaryVelocity < 0 && onLeft != null) {
      onLeft();
    }
  }

  void onVertical(DragEndDetails e) {
    if (e.primaryVelocity > 0 && onDown != null) {
      onDown();
    }
    if (e.primaryVelocity < 0 && onUp != null) {
      onUp();
    }
  }
}
