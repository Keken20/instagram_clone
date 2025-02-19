import 'package:flutter/material.dart';

class CustomTextFormFiel extends StatelessWidget {
  const CustomTextFormFiel(
      {super.key,
      required this.hintText,
      required this.obscureText,
      this.controller});
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        obscureText: obscureText,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(10, 0, 0, 26),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black26),
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(
                color: Colors.black12,
                width: 1,
              )),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(
                color: Colors.black12,
                width: 1,
              )),
        ),
      ),
    );
  }
}
