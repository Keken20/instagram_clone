import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final String imageUrl;
  final String username;
  final bool hasStory;
  final bool isLive;

  const StoryWidget(
      {super.key,
      required this.imageUrl,
      required this.username,
      this.hasStory = false,
      this.isLive = false // If true, shows a colored border
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                gradient: hasStory
                    ? const LinearGradient(
                        colors: [
                          Color(0XFFE20337),
                          Color(0XFFC60188),
                          Color(0XFF7700C3)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white, // Background for the ring
                child: CircleAvatar(
                  radius: 32, // Slightly smaller to fit inside
                  backgroundImage: AssetImage(imageUrl),
                ),
              ),
            ),
            if (isLive)
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 20,
                    width: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 16,
                        width: 26,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xffC90083),
                                  Color(0xffD22463),
                                  Color(0xffE10038),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(3)),
                        child: const Center(
                          child: Text(
                            "Live",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
        const SizedBox(height: 5),
        Text(
          username,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
