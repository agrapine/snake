import 'package:flutter/material.dart';
import 'package:scoped/di.dart';
import 'package:snake/game/index.dart';
import 'package:snake/widget/index.dart';

class Board extends StatelessWidget {
  Widget build(BuildContext context) {
    final scene = Scope.get<Scene>(context);

    return Container(
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: FluidBuilder<Snake>(
                          fluid: scene.player1,
                          builder: (context, snake) => SnakeWidget(snake),
                        ),
                      ),
                      Positioned.fill(
                        child: FluidBuilder<Snake>(
                          fluid: scene.player2,
                          builder: (context, snake) => SnakeWidget(snake),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          
        ],
      ),
    );
  }
}
