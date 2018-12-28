import 'package:snake/game/index.dart';

class Scene {
  

  World _world;
  World get world => _world;

  Snake _player1;
  Snake get player1 => _player1;

  Snake _player2;
  Snake get player2 => _player2;

  Snake enemy(Snake player) => player == player1 ? player2 : player1;

  Scene() {
    _world = World(this);
    _player1 = Snake.red(this);
    _player2 = Snake.blue(this);
  }
}
