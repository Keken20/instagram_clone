import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_copy/presentation/themes/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [_buildPostHeader(), const PostContent()],
      ),
    );
  }
}

Widget _buildPostHeader() {
  return Container(
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    child: Row(
      children: [
        Container(
          height: 40,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/iguser5.png"),
          ),
        ),
        _buildUserInfo(),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
      ],
    ),
  );
}

Widget _buildUserInfo() {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          const TextSpan(
            text: "joshua_l ",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          WidgetSpan(
              child: Icon(
            Icons.verified,
            color: const AppColors().blue,
            size: 15,
          ))
        ])),
        const Text("Tokyo, Japan",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11)),
      ],
    ),
  );
}

class PostContent extends StatefulWidget {
  const PostContent({super.key});

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  final PageController _pageController = PageController();
  bool isLiked = false;
  int _currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 375,
                  width: double.infinity,
                  color: Colors.red,
                  child: GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        if (isLiked == false) {
                          isLiked = true;
                        } else {
                          isLiked = false;
                        }
                      });
                    },
                    child: PageView(
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value + 1;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      children: const [
                        Image(
                          image: AssetImage("assets/images/post1.png"),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: AssetImage("assets/images/post1.png"),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: AssetImage("assets/images/post1.png"),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 26,
                    width: 34,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(18, 26, 26, 61)
                            .withOpacity(.70),
                        borderRadius: BorderRadius.circular(13)),
                    child: Center(
                      child: Text(
                        "$_currentPage/3",
                        style: TextStyle(
                            color: const AppColors().white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ),
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (isLiked == false) {
                            isLiked = true;
                          } else {
                            isLiked = false;
                          }
                        });
                      },
                      icon: FaIcon(
                        isLiked == false
                            ? FontAwesomeIcons.heart
                            : FontAwesomeIcons.solidHeart,
                        color: isLiked == false
                            ? Colors.black.withOpacity(.60)
                            : Colors.red,
                      )),
                  InkWell(
                    onTap: () {},
                    child: const Image(
                        image: AssetImage("assets/images/Comment.png")),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: const Image(
                        image: AssetImage("assets/images/messenger.png")),
                  ),
                  const SizedBox(width: 80),
                  Align(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const SlideEffect(
                          activeDotColor: Color(0xff3897F0),
                          dotHeight: 6,
                          dotWidth: 6,
                          spacing: 2),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {},
                      child: const Image(
                          image: AssetImage("assets/images/Save.png")),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Container(
                    height: 17,
                    width: 17,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/iguser4.png"),
                    ),
                  )),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 7,
                  )),
                  const TextSpan(
                      text: "Liked by ",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
                  const TextSpan(
                      text: "craig_love ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                  const TextSpan(
                      text: "and ",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
                  const TextSpan(
                      text: "44,686",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 13))
                ])),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(14, 2, 30, 2),
                child: SizedBox(
                  width: double.infinity,
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "joshua_l",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13)),
                    TextSpan(
                        text:
                            " The game in Japan was amazing and I want  to share some photos",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13)),
                  ])),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
