import 'package:hive/hive.dart';
part 'score.g.dart';

@HiveType(typeId: 0)
class HighScore extends HiveObject {
  @HiveField(0)
  int score;

  HighScore(this.score);
}
