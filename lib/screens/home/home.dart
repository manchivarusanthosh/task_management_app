// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_management_app/models/task.dart';
import 'package:task_management_app/screens/home/widgets/go_premium.dart';
import 'package:task_management_app/screens/home/widgets/tasks.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoPremium(),
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Tasks",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Tasks()),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}

Widget _bottomNavigationBar() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
          )
        ]),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_rounded,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
              label: 'Person', icon: Icon(Icons.person_rounded, size: 30)),
        ],
      ),
    ),
  );
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(children: [
      Container(
        height: 45,
        width: 45,
        margin: EdgeInsets.only(left: 15),
        child: ClipRRect(
          child: Image.asset(
            'assets/images/avatar.jpg',
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      SizedBox(width: 10),
      Text(
        'Hi Santhosh!',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 26),
      )
    ]),
    // ignore: prefer_const_literals_to_create_immutables
    actions: [
      Icon(
        Icons.more_vert,
        color: Colors.black,
        size: 40,
      )
    ],
  );
}
