import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/view_model/add_record.dart';

import 'graph_view.dart';
import 'history_view.dart';

List<IconData> iconList = [
  Icons.graphic_eq,
  Icons.history,
];

int activeIndex = 0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one_sharp),
        onPressed: () {
          Get.to(AddRecordView());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: activeIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.sharpEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => activeIndex = index),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: activeIndex == 0 ? Text('Graph') : Text('History'),
      ),
      body: activeIndex == 0 ? GraphScreen() : HistoryScreen(),
    );
    ;
  }
}
