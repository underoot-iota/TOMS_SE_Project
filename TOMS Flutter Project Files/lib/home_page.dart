import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:toms_se_project/home.dart';
import 'package:toms_se_project/profile.dart';

List<Widget> screens = [home(), profile()];
String current_email = '';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  var buttonText = 'Initiate System';
  var buttonColor = Color(0xff0DCD0D);
  bool buttonValue = true;

  int _index = 0;

  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: screens,
        controller: _pageController,
        onPageChanged: (val) {
          setState(
            () {
              _index = val;
            },
          );
        },
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _index,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          SalomonBottomBarItem(
            // selectedColor: Colors.amber,
            // unselectedColor: Colors.red,
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          setState(
            () {
              _index = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          );
        },
      ),
    );
  }
}
