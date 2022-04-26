import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:toms_se_project/admin_home.dart';
import 'package:toms_se_project/admin_profile.dart';


List<Widget> screens = [admin_home(), admin_profile()];
String current_user = '';


class admin_home_page extends StatefulWidget {
  const admin_home_page({ Key? key }) : super(key: key);
  

  @override
  State<admin_home_page> createState() => _admin_home_pageState();
}

class _admin_home_pageState extends State<admin_home_page> {

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
          setState(() {
            _index = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
      ),
    );
  }
}