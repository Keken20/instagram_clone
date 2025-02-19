import 'package:flutter/material.dart';
import 'package:instagram_copy/data/user_model.dart';
import 'package:instagram_copy/presentation/widgets/post_widget.dart';

import '../themes/colors.dart';
import '../widgets/story_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const AppColors().white,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xffFAFAFA),
              floating: true,
              snap: true,
              expandedHeight: 70,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_outlined),
                iconSize: 35,
              ),
              title: const Image(
                image: AssetImage("assets/images/logos_instagram.png"),
                height: 30,
              ),
              centerTitle: true,
              actions: [
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                      image: AssetImage("assets/images/igtv.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: const SizedBox(
                    height: 25,
                    width: 25,
                    child: Image(
                      image: AssetImage("assets/images/messenger.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Colors.black.withOpacity(.25), width: 1),
                          bottom: BorderSide(
                              color: Colors.black.withOpacity(.25), width: 1))),
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior(),
                    child: ListView.builder(
                        itemCount: userModel.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: StoryWidget(
                              imageUrl: userModel[index].imageUrl,
                              username: userModel[index].username,
                              hasStory: userModel[index].hasStory,
                              isLive: userModel[index].isLive,
                            ),
                          );
                        }),
                  )),
              const PostWidget(),
              const PostWidget()
            ]))
          ],
        ),
      ),
    );
  }
}
