import 'package:flutter/material.dart';
import 'package:todey/widgets/checktile.dart';

class CheckTileView extends StatelessWidget {
  const CheckTileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ListView(children: getTiles()),
    );
  }
}

List<Widget> getTiles() {
  List<Widget> tiles = [];

  for (int i = 0; i < 15; i++) {
    tiles.add(CheckTile('Catch the train'));
  }
  return tiles;
}
