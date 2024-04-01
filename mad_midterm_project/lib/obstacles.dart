import 'dart:math';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'game_object.dart';
import 'sprite.dart';

List<Sprite> obstacles = [
  Sprite()
    ..imagePath = "assets/images/obstacles/bamboo1.png"
    ..imageWidth = 70
    ..imageHeight = 90,
  Sprite()
    ..imagePath = "assets/images/obstacles/bamboo2.png"
    ..imageWidth = 70
    ..imageHeight = 90,
  Sprite()
    ..imagePath = "assets/images/obstacles/kubo.png"
    ..imageWidth = 70
    ..imageHeight = 90,
  Sprite()
    ..imagePath = "assets/images/obstacles/tambay.png"
    ..imageWidth = 70
    ..imageHeight = 90,
];

class Cactus extends GameObject {
  final Sprite sprite;
  final Offset worldLocation;

  Cactus({required this.worldLocation})
      : sprite = obstacles[Random().nextInt(obstacles.length)];

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      (worldLocation.dx - runDistance) * worlToPixelRatio,
      screenSize.height / 1.75 - sprite.imageHeight,
      sprite.imageWidth.toDouble(),
      sprite.imageHeight.toDouble(),
    );
  }

  @override
  Widget render() {
    return Image.asset(sprite.imagePath);
  }
}
