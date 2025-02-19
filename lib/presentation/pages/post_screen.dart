import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              "Post",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  size: 25,
                )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                height: screenHeight * .05,
                color: Colors.blue,
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.red,
              height: screenWidth,
              width: screenWidth,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(image),
                height: screenWidth,
                width: screenWidth,
              ),
            )
          ]))
        ],
      ),
    );
  }
}
