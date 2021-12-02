// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_management_app/models/task.dart';

class DetailPage extends StatelessWidget {
  final Task task;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  DetailPage(this.task);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [_builAppbar(context)],
        ));
  }

  _builAppbar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 20,
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        Icon(
          Icons.more_vert,
          size: 40,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${task.title} tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'You have ${task.left} tasks for today',
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}
