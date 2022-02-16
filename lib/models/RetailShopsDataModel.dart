class RetailShopsDataModel {
  int id;
  String title;
  String likeCount;
  String dislikeCount;
  String ratingCount;
  String city;
  String image;

  RetailShopsDataModel(
      {this.id,
      this.title,
      this.dislikeCount,
      this.likeCount,
      this.ratingCount,
      this.city,
      this.image});

  RetailShopsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    dislikeCount = json['dislike_count'];
    likeCount = json['like_count'];
    ratingCount = json['rating_count'];
    city = json['city'];
    image = json['image'];
  }
}
