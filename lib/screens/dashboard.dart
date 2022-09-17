import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_practical_task/screens/home.dart';
import 'package:my_practical_task/screens/user_details.dart';
import 'package:my_practical_task/screens/widgets/theme.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int tabIndex = 0;
  late List<Widget> listScreens;

  void initState() {
    super.initState();
    listScreens = [
      Home(),
      UserDetails(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          backgroundColor: white,
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_outlined),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: listScreens[tabIndex],

    );
  }
}
