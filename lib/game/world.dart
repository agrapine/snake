import 'dart:math';

import 'package:scoped/di.dart';
import 'package:snake/game/scene.dart';
import 'package:snake/game/unit.dart';

class World extends Fluid {
  final Random rand = Random();

  int _size = 20;
  int get size => _size;
  int get rows => size;
  int get cols => size;

  List<Box> _map;
  List<Box> get map => _map;

  final Scene scene;

  World(this.scene) {
    _map = Iterable.generate(rows * cols).map((i) => Box.Empty).toList();
    //_map[_index(P(0, 0))] = Box.Brick;
    _map[_index(P(10, 1))] = Box.Snack;
  }

  P clamp(P p) => P(p.x % cols, p.y % rows);

  _index(P p) => p.x + p.y * cols;

  int nextEmpty() {
    var index = 0;
    do {
      index = rand.nextInt(rows * cols);
    } while (_map[index] != Box.Empty);
    return index;
  }

  Box hit(P p) {
    final index = _index(p);
    final box = _map[index];

    switch (box) {
      case Box.Snack:
        _map[index] = Box.Empty;
        _map[nextEmpty()] = Box.Snack;
        notify();
        break;
      default:
        break;
    }
    return box;
  }
}
