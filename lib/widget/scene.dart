import 'package:flutter/material.dart';
import 'package:scoped/di.dart';
import 'package:snake/game/index.dart';
import 'package:snake/widget/index.dart';

class SceneWidget extends StatelessWidget {
  SceneWidget();
  Widget build(BuildContext context) {
    final scene = Scope.get<Scene>(context);
    final size = MediaQuery.of(context).size;
    final square = (size.width < size.height ? size.width : size.height) - 16.0;
    final radius = square / 2;
    final rect = Rect.fromLTWH(
        size.width / 2 - radius, size.height / 2 - radius, square, square);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Background(Scope.of(context).store)),
          Positioned.fromRect(
              rect: rect,
              child: FluidBuilder<World>(
                  fluid: scene.world,
                  builder: (_, world) => BoardWidget(world))),
          Positioned.fromRect(
              rect: rect,
              child: FluidBuilder<Snake>(
                  fluid: scene.player1,
                  builder: (_, snake) => SnakeWidget(snake))),
          Positioned.fromRect(
              rect: rect,
              child: FluidBuilder<Snake>(
                  fluid: scene.player2,
                  builder: (_, snake) => SnakeWidget(snake))),
          Positioned.fill(
              child: Column(
            children: <Widget>[
              Expanded(
                  child: Stick(
                onLeft: scene.player1.left,
                onRight: scene.player1.right,
                onDown: scene.player1.down,
                onUp: scene.player1.up,
              )),
              Expanded(
                child: Stick(
                  onLeft: scene.player2.left,
                  onRight: scene.player2.right,
                  onDown: scene.player2.down,
                  onUp: scene.player2.up,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
