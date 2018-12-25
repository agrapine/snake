import 'package:flutter/material.dart';
import 'package:snake/game/index.dart';
import 'package:snake/theme.dart';

class WorldWidget extends StatelessWidget {
  final World world;
  WorldWidget(this.world);
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WorldPainter(world),
    );
  }
}

class WorldPainter extends CustomPainter {
  final Paint boardPaint;
  final Paint boardLeftPaint;
  final Paint boardRightPaint;

  final Paint borderPaint;
  final Paint linePaint;
  final World world;

  WorldPainter(this.world)
      : boardPaint = Paint()
          ..color = SwipeTheme.boardBackground
          ..style = PaintingStyle.fill,
        boardLeftPaint = Paint()
          ..color = SwipeTheme.boardLeftOverlay
          ..style = PaintingStyle.fill,
        boardRightPaint = Paint()
          ..color = SwipeTheme.boardRightOverlay
          ..style = PaintingStyle.fill,
        borderPaint = Paint()
          ..color = SwipeTheme.boardBorder
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5,
        linePaint = Paint()
          ..color = SwipeTheme.boardLine
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5;

  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), boardPaint);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width / 2, size.height), boardLeftPaint);
    canvas.drawRect(Rect.fromLTWH(size.width / 2, 0, size.width / 2, size.height),
        boardRightPaint);

    final iw = size.width / world.size;
    for (int i = 1; i < world.size; i++) {
      canvas.drawLine(
          Offset(iw * i, 0), Offset(iw * i, size.height), linePaint);
      canvas.drawLine(Offset(0, iw * i), Offset(size.width, iw * i), linePaint);
    }
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), borderPaint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
