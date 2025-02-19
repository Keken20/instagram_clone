import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:instagram_copy/presentation/pages/main_page.dart';
import 'package:instagram_copy/presentation/themes/colors.dart';
import 'package:instagram_copy/presentation/widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isEmpty = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_checkEmpty);
    _passwordController.addListener(_checkEmpty);
  }

  void _checkEmpty() {
    setState(() {
      isEmpty = _usernameController.text.trim().isEmpty ||
          _passwordController.text.trim().isEmpty;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            const Center(
              child: Image(
                image: AssetImage("assets/images/logos_instagram.png"),
                height: 49,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextFormFiel(
              hintText: "Username",
              obscureText: false,
              controller: _usernameController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormFiel(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      color: const AppColors().blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                )),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: isEmpty
                        ? const AppColors().blue.withOpacity(.5)
                        : const AppColors().blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    fixedSize: const Size.fromHeight(44)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                child: Center(
                    child: Text(
                  "Log in",
                  style: TextStyle(color: const AppColors().white),
                ))),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.squareFacebook,
                    color: const AppColors().blue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Log in with Facebook",
                    style: TextStyle(
                      color: const AppColors().blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 132,
                  height: 1,
                  color: Colors.black.withOpacity(.20),
                ),
                Padding(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "OR",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(.40)),
                    )),
                Container(
                  width: 132,
                  height: 1,
                  color: Colors.black.withOpacity(.20),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            RichText(
                text: TextSpan(
                    text: "Don't have account?",
                    style: TextStyle(
                        color: Colors.black.withOpacity(.3),
                        fontWeight: FontWeight.w400),
                    children: [
                  TextSpan(
                      text: " Sign Up.",
                      style: TextStyle(color: const AppColors().blue))
                ])),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: 84,
          child: Column(
            children: [
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Instagram or Facebook",
                style: TextStyle(
                    color: Colors.black.withOpacity(.40),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          )),
    );
  }
}
