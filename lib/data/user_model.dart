class UserModel {
  final String imageUrl;
  final String username;
  bool hasStory;
  bool isLive;

  UserModel(
      {required this.imageUrl,
      required this.username,
      this.hasStory = false,
      this.isLive = false});
}

final List<UserModel> userModel = [
  UserModel(
      imageUrl: "assets/images/profile_image.png",
      username: "Your Story",
      hasStory: true),
  UserModel(
      imageUrl: "assets/images/user1.png",
      username: "karennne",
      hasStory: true,
      isLive: true),
  UserModel(
      imageUrl: "assets/images/iguser2.png",
      username: "zackjohn",
      hasStory: true),
  UserModel(
      imageUrl: "assets/images/iguser3.png",
      username: "kieron_d",
      hasStory: true),
  UserModel(
      imageUrl: "assets/images/iguser4.png",
      username: "craig_love",
      hasStory: true),
];
