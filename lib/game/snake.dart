import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scoped/di.dart';
import 'package:snake/game/index.dart';
import 'package:snake/theme.dart';

class Snake extends Fluid {
  final Scene scene;

  Offset direction;
  final List<P> parts;
  final Color color;
  final Duration tickInterval = const Duration(milliseconds: 200);
  Timer timer;

  Snake({this.parts, this.color, @required this.scene}) {
    timer = Timer.periodic(tickInterval, (t) => _onTick());
  }

  _onTick() {
    move(_lastOffset);
  }

  factory Snake.red(Scene scene) => Snake(
      color: Swete.red,
      parts: [P(0, 0), P(0, 1), P(0, 2), P(1, 2)],
      scene: scene);
  factory Snake.blue(Scene scene) =>
      Snake(color: Swete.blue, parts: [P(3, 0), P(3, 1)], scene: scene);

  left() => move(P(-1, 0));
  right() => move(P(1, 0));
  up() => move(P(0, -1));
  down() => move(P(0, 1));

  P _lastOffset = P(1, 0);

  move(P offset) {
    if (offset == null) return;
    _lastOffset = offset;
    final cp = scene.world.clamp(parts.last + offset);
    parts.add(cp);
    parts.removeAt(0);
    notify();
  }
}
