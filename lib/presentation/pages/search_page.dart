import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([_buildSearchBar()]))
        ],
      )),
    );
  }
}

Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
    child: Container(
      child: Row(
        children: [
          SizedBox(
              height: 36,
              width: 327,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(.30),
                  ),
                  filled: true,
                  hintText: "Search",
                  fillColor: const Color(0xff767680).withOpacity(.12),
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: const Color(0xff767680).withOpacity(.12),
                        width: 1,
                      )),
                ),
              ))
        ],
      ),
    ),
  );
}
