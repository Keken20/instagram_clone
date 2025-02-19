class NotificationsModel {
  final String notifDescription;
  final List<String> notifUsers;
  final List<String> notifUsersProfile;
  final List<String>? notifImages;
  final String hours;
  final bool? hasStory;

  NotificationsModel(
      {required this.notifDescription,
      required this.notifUsers,
      required this.notifUsersProfile,
      required this.hours,
      this.notifImages,
      this.hasStory = false});

  Map<String, dynamic> toJson() {
    return {
      'notifDescription': notifDescription,
      'notifUsers': notifUsers,
      'notifUsersProfile': notifUsersProfile,
      'notifImages': notifImages ?? [],
      'hours': hours,
    };
  }

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      notifDescription: json['notifDescription'] ?? '',
      notifUsers: List<String>.from(json['notifUsers'] ?? []),
      notifUsersProfile: List<String>.from(json['notifUsersProfile'] ?? []),
      notifImages: List<String>.from(json['notifImages'] ?? []),
      hours: json['hours'] ?? '',
    );
  }
}

List<NotificationsModel> notifications = [
  NotificationsModel(
      notifDescription: "karennne liked 3 posts.",
      notifUsers: ["karenne"],
      notifUsersProfile: ["assets/images/user1.png"],
      notifImages: [
        "assets/images/igimage1.png",
        "assets/images/igimage2.png",
        "assets/images/igimage3.png"
      ],
      hours: "3h"),
  NotificationsModel(
      notifDescription:
          "kiero_d, zackjohn and craig_love liked joshua_l photo.",
      notifUsers: ["karenne"],
      notifUsersProfile: [
        "assets/images/iguser2.png",
        "assets/images/iguser3.png"
      ],
      notifImages: [
        "assets/images/post1.png",
      ],
      hours: "3h"),
  NotificationsModel(
      notifDescription: "kiero_d started following craig_love.",
      notifUsers: ["karenne"],
      notifUsersProfile: ["assets/images/iguser3.png"],
      notifImages: [],
      hours: "3h"),
  NotificationsModel(
      notifDescription: "craig_love liked 8 posts.",
      notifUsers: ["karenne"],
      notifUsersProfile: ["assets/images/Oval.png"],
      notifImages: [
        "assets/images/post41.png",
        "assets/images/post42.png",
        "assets/images/post43.png",
        "assets/images/post44.png",
        "assets/images/post45.png",
        "assets/images/post46.png",
        "assets/images/post47.png",
        "assets/images/post48.png",
      ],
      hours: "3h"),
  NotificationsModel(
      notifDescription: "maxjacobson and zackjohn liked mis_potter’s post",
      notifUsers: ["karenne"],
      notifUsersProfile: [
        "assets/images/iguser2.png",
        "assets/images/iguser3.png"
      ],
      notifImages: [
        "assets/images/post51.png",
      ],
      hours: "3h"),
  NotificationsModel(
      notifDescription: "maxjacobson and craig_love liked martini_rond’s post.",
      notifUsers: ["karenne"],
      notifUsersProfile: [
        "assets/images/iguser2.png",
        "assets/images/iguser3.png"
      ],
      notifImages: [
        "assets/images/post61.png",
      ],
      hours: "3h"),
  NotificationsModel(
      notifDescription:
          "karennne liked martini_rond’s comment: @martini_rond Nice!",
      notifUsers: ["karenne"],
      notifUsersProfile: ["assets/images/user1.png"],
      notifImages: [
        "assets/images/post71.png",
      ],
      hours: "3h",
      hasStory: true),
  NotificationsModel(
      notifDescription: "maxjacobson liked 3 posts.",
      notifUsers: ["karenne"],
      notifUsersProfile: ["assets/images/user2.png"],
      notifImages: [
        "assets/images/post81.png",
        "assets/images/post82.png",
        "assets/images/post83.png",
      ],
      hours: "3h",
      hasStory: true),
];
