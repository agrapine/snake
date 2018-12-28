import 'package:flutter/material.dart';
import 'package:snake/game/index.dart';
import 'package:snake/theme.dart';

class SnakeWidget extends StatelessWidget {
  final Snake snake;
  SnakeWidget(this.snake);
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SnakePainter(snake),
    );
  }
}

class SnakePainter extends CustomPainter {
  final Snake snake;
  final Paint bodyPaint;
  final Paint headPaint;
  final Paint borderPaint;

  SnakePainter(this.snake)
      : bodyPaint = Paint()..color = snake.color,
        headPaint = Paint()..color = snake.colorAccent,
        borderPaint = Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;

  void paint(Canvas canvas, Size size) {
    final iw = size.width / snake.scene.world.size;
    snake.parts.forEach((part) {
      drawPart(canvas, part, iw);
    });
    drawPart(canvas, snake.parts.last, iw, isHead: true);
  }

  drawPart(Canvas canvas, P part, double iw, {isHead = false}) {
    canvas.drawRect(Rect.fromLTWH(iw * part.x, iw * part.y, iw, iw),
        isHead ? headPaint : bodyPaint);
    canvas.drawRect(
        Rect.fromLTWH(iw * part.x, iw * part.y, iw, iw), borderPaint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
