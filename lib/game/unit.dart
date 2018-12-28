enum Box { Empty, Brick, Snack }

class P {
  final int x;
  final int y;
  P(this.x, this.y);
  operator +(P p) => P(this.x + p.x, this.y + p.y);
}
