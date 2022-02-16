import 'package:hive/hive.dart';

part 'shops.g.dart';

@HiveType(typeId: 0)
class Shops extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String image;

  @HiveField(3)
  String city;

  @HiveField(4)
  String like_count;

  @HiveField(4)
  String dislike_count;

  @HiveField(4)
  String rating_count;

  Shops(this.id, this.title, this.image, this.city, this.like_count,
      this.dislike_count, this.rating_count);
}
