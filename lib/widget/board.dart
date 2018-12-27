import 'package:flutter/material.dart';
import 'package:snake/game/index.dart';
import 'package:snake/theme.dart';

class BoardWidget extends StatelessWidget {
  final World world;
  BoardWidget(this.world);
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BoardPainter(world),
    );
  }
}

class BoardPainter extends CustomPainter {
  final Paint boardPaint;
  final Paint boardLeftPaint;
  final Paint boardRightPaint;

  final Paint borderPaint;
  final Paint linePaint;
  final World world;

  BoardPainter(this.world)
      : boardPaint = Paint()
          ..color = Swete.boardBackground
          ..style = PaintingStyle.fill,
        boardLeftPaint = Paint()
          ..color = Swete.boardLeftOverlay
          ..style = PaintingStyle.fill,
        boardRightPaint = Paint()
          ..color = Swete.boardRightOverlay
          ..style = PaintingStyle.fill,
        borderPaint = Paint()
          ..color = Swete.boardBorder
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5,
        linePaint = Paint()
          ..color = Swete.boardLine
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5;

  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), boardPaint);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height / 2), boardLeftPaint);
    canvas.drawRect(Rect.fromLTWH(0, size.height / 2, size.width, size.height / 2),
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
