import 'package:flutter/material.dart';
import 'package:instagram_copy/presentation/pages/post_screen.dart';
import 'package:instagram_copy/presentation/themes/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xffFFFFFF),
              automaticallyImplyLeading: false,
              title: const SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.lock,
                        size: 12,
                      ),
                    ),
                    Text(
                      "jacob_w",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    fill: 1,
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: _buildProfileInfo(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: _buildProfileNameAndBio("Jacob West"),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Center(
                  child: _editProfileButton(context),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: _buildHighlightContainer(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                height: 1,
              ),
            ),
            SliverToBoxAdapter(
              child: _buildPostContainer(context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildProfileInfo() {
  return Padding(
    padding: const EdgeInsets.only(right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            color: Color(0xffC7C7CC),
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            radius: 39,
            backgroundColor: Colors.white, // Background for the ring
            child: CircleAvatar(
              radius: 37, // Slightly smaller to fit inside
              backgroundImage: AssetImage("assets/images/profile_image.png"),
            ),
          ),
        ),
        _buildProfileUserInfos("54", "Posts"),
        _buildProfileUserInfos("834", "Followers"),
        _buildProfileUserInfos("54", "Following"),
      ],
    ),
  );
}

Widget _buildProfileUserInfos(String count, String info) {
  return Column(
    children: [
      Text(
        count,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Text(
        info,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      )
    ],
  );
}

Widget _buildProfileNameAndBio(String name) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        const SizedBox(
          height: 2,
        ),
        RichText(
            text: TextSpan(
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                children: [
              const TextSpan(text: "Digital goodies designer "),
              TextSpan(
                  text: "@pixsellz",
                  style: TextStyle(color: const AppColors().blue))
            ])),
        const SizedBox(
          height: 2,
        ),
        const Text(
          "Everything is designed.",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        )
      ],
    ),
  );
}

Widget _editProfileButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: SizedBox(
      height: MediaQuery.sizeOf(context).height * .04,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xffFFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: const Color(0xff3c3c432e).withOpacity(.18),
                  width: 1,
                ),
              ),
              fixedSize: const Size.fromHeight(29)),
          onPressed: () {},
          child: const Center(
              child: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.black),
          ))),
    ),
  );
}

Widget _buildHighlightContainer() {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 30, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAddHighlight(),
        _buildHighlightImage("Friends", "assets/images/highlight1.png"),
        _buildHighlightImage("Sport", "assets/images/highlight2.png"),
        _buildHighlightImage("Design", "assets/images/highlight3.png")
      ],
    ),
  );
}

Widget _buildHighlightImage(String highlightName, String image) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(1),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xffC7C7CC)),
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xffC7C7CC),
            backgroundImage: AssetImage(image),
          ),
        ),
      ),
      Center(
        child: Text(
          highlightName,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
        ),
      )
    ],
  );
}

Widget _buildAddHighlight() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(1),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xffC7C7CC)),
        child: const CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
      const Center(
        child: Text(
          "New",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
        ),
      )
    ],
  );
}

Widget _buildPostContainer(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildPostTabs(),
      Container(constraints: const BoxConstraints(), child: _postTile(context)),
    ],
  );
}

Widget _buildPostTabs() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 1))),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.grid_on_sharp,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 30,
                )),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
                height: 50,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white))),
                child: const Image(
                  image: AssetImage("assets/images/Shape.png"),
                )),
          ),
        )
      ],
    ),
  );
}

List<String> images = [
  "assets/images/Rectangle1.png",
  "assets/images/Rectangle (2).png",
  "assets/images/Rectangle (3).png",
  "assets/images/Rectangle (4).png",
  "assets/images/Video Post.png",
  "assets/images/Rectangle (5).png",
  "assets/images/Rectangle (6).png",
  "assets/images/Rectangle (7).png",
  "assets/images/Rectangle (8).png",
];

Widget _postTile(BuildContext context) {
  return GridView.count(
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 3,
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    children: images.map((imagePath) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostScreen(image: imagePath)));
        },
        child: Padding(
          padding: const EdgeInsets.all(.5), // Add spacing between images
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      );
    }).toList(),
  );
}
