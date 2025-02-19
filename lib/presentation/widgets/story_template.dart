import 'package:flutter/material.dart';

class StoryTemplate extends StatelessWidget {
  final bool hasStory;
  final String image;
  const StoryTemplate({super.key, required this.hasStory, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}
