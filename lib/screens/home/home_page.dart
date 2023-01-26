import 'package:aplikasipertama/models/book.dart';
import 'package:flutter/material.dart';
import 'package:aplikasipertama/themes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'components/recent_book.dart';
import 'components/trending_book.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = "/homePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _categories = [
    "All Books",
    "Comic",
    "Novel",
    "Manga",
    "Fairy Tales",
  ];

  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/profile.png"),
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello Yusup", style: semiBoldText16),
                Text(
                  "Good Morning",
                  style: regulerText14.copyWith(color: Colors.grey),
                )
              ],
            ),
            Spacer(),
            const Icon(
              Icons.menu,
              size: 25,
            )
          ],
        ),
      );
    }

    Widget searchField() {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Find Your Favorite Book",
              hintStyle: mediumText12.copyWith(color: Colors.grey),
              fillColor: Colors.grey[100],
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              isCollapsed: true,
              contentPadding: EdgeInsets.all(18),
              suffixIcon: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: Colors.green[800],
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  )),
            ),
          ));
    }

    Widget recentBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            RecentBook(
              image: 'assets/images/img1.jpg',
              title: "The Magic",
            ),
            SizedBox(
              width: 20,
            ),
            RecentBook(
              image: 'assets/images/img2.jpg',
              title: "The Martian",
            ),
          ],
        ),
      );
    }

    Widget categories(int index) {
      return InkWell(
        onTap: () {
          setState(() {
            _isSelected = index;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 30, right: 12),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color:
                _isSelected == index ? Colors.green[700] : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            _categories[index],
            style: semiBoldText14.copyWith(
                color: _isSelected == index ? Colors.white : Colors.grey),
          ),
        ),
      );
    }

    Widget listCategories() {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories
              .asMap()
              .entries
              .map((MapEntry map) => categories(map.key))
              .toList(),
        ),
      );
    }

    Widget trendingBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
            children: bookList
                .asMap()
                .entries
                .map((MapEntry map) => TrendingBook(
                      info: bookList[map.key],
                    ))
                .toList()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(
                  height: 30,
                ),
                searchField(),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text("Recent Book",
                      style: semiBoldText16.copyWith(color: Colors.black)),
                ),
                SizedBox(
                  height: 12,
                ),
                recentBook(),
              ],
            ),
          ),
          listCategories(),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Text("Trending Now",
                style: semiBoldText16.copyWith(
                  color: Colors.black,
                )),
          ),
          trendingBook(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
