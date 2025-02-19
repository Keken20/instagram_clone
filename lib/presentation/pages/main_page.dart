import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_copy/presentation/pages/follwing_page.dart';
import 'package:instagram_copy/presentation/pages/home_page.dart';
import 'package:instagram_copy/presentation/pages/profile_page.dart';
import 'package:instagram_copy/presentation/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const SearchPage(),
    const FollowingPage(),
    const FollowingPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: const Color(0xffFAFAFA),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          iconSize: 25,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                color: const Color(0XFF262626),
              ),
              label: "Home",
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Search"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: FaIcon(_selectedIndex == 3
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart),
                label: "Home"),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 25,
                width: 25 ,
                child: CircleAvatar(
                  backgroundColor: _selectedIndex == 4
                      ? Colors.black.withOpacity(.50)
                      : Colors.transparent, // Highlight when selected
                  child: const CircleAvatar(
                    radius: 12, // Adjust radius if needed
                    backgroundImage:
                        AssetImage("assets/images/profile_image.png"),
                  ),
                ),
              ),
              label: "Profile",
            ),
          ]),
    );
  }
}
