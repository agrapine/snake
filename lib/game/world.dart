import 'package:scoped/di.dart';
import 'package:snake/game/scene.dart';
import 'package:snake/game/unit.dart';

class World extends Fluid {
  int _size = 20;
  int get size => _size;
  int get rows => size;
  int get cols => size;
  List<int> _map;
  List<int> get map => _map;

  final Scene scene;
  World(this.scene) {
    _map = List(rows * cols);
  }

  P clamp(P p) => P(p.x % cols, p.y % rows);
}
