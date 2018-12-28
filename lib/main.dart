import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped/di.dart';
import 'package:snake/game/index.dart';
import 'package:snake/widget/index.dart';
import 'package:audioplayers/audio_cache.dart';

    

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
    Store store = Store()
    ..add(Scene())
    ..add(AudioCache()..loop('music/bensound_instinct.mp3'));
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
