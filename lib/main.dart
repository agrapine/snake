import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped/di.dart';
import 'package:snake/game/index.dart';
import 'package:snake/widget/index.dart';

init() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

void main() {
  init();
  runApp(SnakeApp());
}

class SnakeApp extends StatelessWidget {
  Widget build(BuildContext context) {
    Store store = Store()..add(Scene());
    return Scope(
        store: store,
        child: MaterialApp(
          title: 'Snake',
          theme: ThemeData(
              primarySwatch: Colors.blue, brightness: Brightness.dark),
          home: SceneWidget(),
        ));
  }
}
