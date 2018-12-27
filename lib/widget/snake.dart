import 'package:flutter/material.dart';
import 'package:snake/game/index.dart';

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
  SnakePainter(this.snake);
  void paint(Canvas canvas, Size size) {
    final iw = size.width / snake.scene.world.size;
    Paint paint = Paint()..color = snake.color;
    Paint border = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    snake.parts.forEach((part) {
      canvas.drawRect(Rect.fromLTWH(iw * part.x, iw * part.y, iw, iw), paint);
      canvas.drawRect(Rect.fromLTWH(iw * part.x, iw * part.y, iw, iw), border);
    });
  }

  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
