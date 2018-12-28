import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:scoped/di.dart';
import 'package:snake/theme.dart';

class Background extends StatefulWidget {
  final Store store;
  Background(this.store);
  BackgroundState createState() => BackgroundState();
}

class BackgroundState extends State<Background> {
  bool isPlaying;

  initState() {
    super.initState();
    isPlaying = true;
  }

  void toogleSound() {
    if (isPlaying) {
      widget.store.get<AudioPlayer>().pause();
      isPlaying = false;
    } else {
      widget.store.get<AudioPlayer>().resume();
      isPlaying = true;
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Container(
      color: Swete.background,
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment(1, -1),
                child: IconButton(
                    icon: Icon(isPlaying ? Icons.volume_up : Icons.volume_off),
                    tooltip: 'bensounds.com',
                    onPressed: () => toogleSound()),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
