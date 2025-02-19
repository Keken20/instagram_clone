import 'package:flutter/material.dart';
import 'package:instagram_copy/presentation/pages/login_page.dart';
import 'package:instagram_copy/presentation/pages/main_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * .25,
            ),
            const Center(
                child: Image(
              image: AssetImage("assets/images/logos_instagram.png"),
              height: 49,
            )),
            SizedBox(
              height: screenHeight * .06,
            ),
            SizedBox(
              height: screenHeight * .15,
              width: screenWidth * .85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * .1,
                    width: screenWidth * .2,
                    child: const CircleAvatar(
                      foregroundImage:
                          AssetImage("assets/images/profile_image.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "jacob_w",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xff3797EF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    fixedSize: const Size.fromHeight(44)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                child: const Center(
                    child: Text(
                  "Log in",
                  style: TextStyle(color: Colors.white),
                ))),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  "Switch Account",
                  style: TextStyle(
                    color: Color(0xff3797EF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: "Don't have account? ",
                      style: TextStyle(
                          color: Colors.black.withOpacity(.40),
                          fontWeight: FontWeight.w400),
                      children: const [
                        TextSpan(
                            text: "Sign Up.",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black))
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
