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

  final Paint snackPaint;

  final Paint borderPaint;
  final Paint linePaint;
  final World world;

  BoardPainter(this.world)
      : boardPaint = Paint()
          ..color = Swete.boardBackground
          ..style = PaintingStyle.fill,
        snackPaint = Paint()
          ..color = Swete.snack
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


    final iw = size.width / world.size;
    final snack = Path()
      ..moveTo(iw / 2, 0)
      ..lineTo(iw, iw / 2)
      ..lineTo(iw / 2, iw)
      ..lineTo(0, iw / 2);

    int ix = 0;
    world.map.forEach((b) {
      switch (b) {
        case Box.Snack:
          canvas.save();
          var tx = ix % world.cols;
          var ty = ix ~/ world.cols;
          canvas.translate(tx * iw, ty * iw);
          canvas.drawPath(snack, snackPaint);
          canvas.restore();
          break;
        default:
      }
      ix++;
    });

    for (int i = 1; i < world.size; i++) {
      canvas.drawLine(
          Offset(iw * i, 0), Offset(iw * i, size.height), linePaint);
      canvas.drawLine(Offset(0, iw * i), Offset(size.width, iw * i), linePaint);
    }
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), borderPaint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
