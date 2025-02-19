import 'package:flutter/material.dart';
import 'package:instagram_copy/data/notifications_model.dart';
import 'package:instagram_copy/presentation/utils/screen_size.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                const ToggleTabs(),
                Column(
                  children: notifications
                      .map((notif) => _buildFollowContent(context, notif))
                      .toList(),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

class ToggleTabs extends StatefulWidget {
  const ToggleTabs({super.key});

  @override
  _ToggleTabsState createState() => _ToggleTabsState();
}

class _ToggleTabsState extends State<ToggleTabs> {
  bool isFollowingSelected = true; // Track selected tab

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        color: const Color(0xffFAFAFA),
        height: 44,
        child: Row(
          children: [
            // "Following" Tab
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFollowingSelected = true;
                  });
                },
                child: _textTabs("Following", isFollowingSelected),
              ),
            ),
            // "You" Tab
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFollowingSelected = false;
                  });
                },
                child: _textTabs("You", !isFollowingSelected),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textTabs(String text, bool selected) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: selected
                ? const BorderSide(width: 1)
                : const BorderSide(color: Colors.white, width: 1))),
    child: Center(
        child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    )),
  );
}

Widget _buildFollowContent(
    BuildContext context, NotificationsModel notificationsModel) {
  // Define text styles

  List<String> images = notificationsModel.notifImages ?? [];

  const normalStyle =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 13); // Normal
  const boldStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 13); // Bold
  final timeStyle = TextStyle(
      fontWeight: FontWeight.w400, color: Colors.black.withOpacity(.50));

  // Split text into words and apply different styles dynamically
  List<TextSpan> textSpans =
      notificationsModel.notifDescription.split(' ').map((word) {
    if (word == "liked" || word == "following" || word == "and") {
      return TextSpan(text: "$word ", style: normalStyle);
      // Normal font
    } else if (word == "comment:" || word == "Nice!") {
      return TextSpan(text: "$word ", style: normalStyle);
    } else if (word.contains("@")) {
      return TextSpan(
          text: "$word ",
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Color.fromARGB(255, 22, 122, 203)));
    } else {
      return TextSpan(text: "$word ", style: boldStyle); // Bold font
    }
  }).toList();

  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        notificationsModel.notifUsersProfile.length <= 1
            ? Container(
                child: notificationsModel.hasStory == false
                    ? CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            notificationsModel.notifUsersProfile.first),
                      )
                    : Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0XFFE20337),
                              Color(0XFFC60188),
                              Color(0XFF7700C3)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor:
                              Colors.white, // Background for the ring
                          child: CircleAvatar(
                            radius: 21, // Slightly smaller to fit inside
                            backgroundImage: AssetImage(
                                notificationsModel.notifUsersProfile.first),
                          ),
                        ),
                      ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width * .12,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage:
                            AssetImage(notificationsModel.notifUsersProfile[0]),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                              notificationsModel.notifUsersProfile[1]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text content
                    SizedBox(
                      width: context.screenWidth * .53,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            ...textSpans, // Styled words
                            TextSpan(
                                text: " ${notificationsModel.hours}",
                                style: timeStyle), // Time part
                          ],
                        ),
                      ),
                    ),

                    // Show only if there's exactly one image
                  ],
                ),

                // If more than one image, move to next line
                if ((images.length) > 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Wrap(
                      spacing: 2,
                      runSpacing: 2,
                      children: images
                          .map((path) =>
                              Image.asset(path, height: 52.7, width: 52.7))
                          .toList(),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if ((notificationsModel.notifImages!.length) == 1)
          Center(child: Image.asset(images.first, height: 52.7, width: 52.7)),
      ],
    ),
  );
}
