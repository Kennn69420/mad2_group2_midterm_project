import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'game_object.dart';
import 'sprite.dart';

List<Sprite> chicken = [
  Sprite()
    ..imagePath = "assets/images/chicken/chick_run1.png"
    ..imageWidth = 80
    ..imageHeight = 90,
  Sprite()
    ..imagePath = "assets/images/chicken/chick_run1.png"
    ..imageWidth = 80
    ..imageHeight = 90,
  Sprite()
    ..imagePath = "assets/images/chicken/chick_run1.png"
    ..imageWidth = 80
    ..imageHeight = 90,
  Sprite()
    ..imagePath = "assets/images/chicken/chick_run2.png"
    ..imageWidth = 80
    ..imageHeight = 90,
  Sprite()
    ..imagePath = "assets/images/chicken/chick_run1.png"
    ..imageWidth = 80
    ..imageHeight = 90,
  Sprite()
    ..imagePath = "assets/images/chicken/inasal.png"
    ..imageWidth = 80
    ..imageHeight = 90,
];

enum ChickenState {
  jumping,
  running,
  dead,
}

class Dino extends GameObject {
  Sprite currentSprite = chicken[0];
  double dispY = 0;
  double velY = 0;
  ChickenState state = ChickenState.running;

  @override
  Widget render() {
    return Image.asset(currentSprite.imagePath);
  }

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      screenSize.width / 10,
      screenSize.height / 1.75 - currentSprite.imageHeight - dispY,
      currentSprite.imageWidth.toDouble(),
      currentSprite.imageHeight.toDouble(),
    );
  }

  @override
  void update(Duration lastUpdate, Duration? elapsedTime) {
    double elapsedTimeSeconds;
    try {
      currentSprite =
          chicken[(elapsedTime!.inMilliseconds / 100).floor() % 2 + 2];
    } catch (_) {
      currentSprite = chicken[0];
    }
    try {
      elapsedTimeSeconds = (elapsedTime! - lastUpdate).inMilliseconds / 1000;
    } catch (_) {
      elapsedTimeSeconds = 0;
    }

    dispY += velY * elapsedTimeSeconds;
    if (dispY <= 0) {
      dispY = 0;
      velY = 0;
      state = ChickenState.running;
    } else {
      velY -= gravity * elapsedTimeSeconds;
    }
  }

  void jump() {
    if (state != ChickenState.jumping) {
      state = ChickenState.jumping;
      velY = jumpVelocity;
    }
  }

  void die() {
    currentSprite = chicken[5];
    state = ChickenState.dead;
  }
}
