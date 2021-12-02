// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_management_app/constants/colors.dart';
import 'package:task_management_app/models/task.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:task_management_app/screens/detail/detail.dart';

class Tasks extends StatefulWidget {
  List taskList = Task.generateTasks();

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
          itemCount: widget.taskList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => widget.taskList[index].isLast
              ? _buildAddTask(widget.taskList)
              : _buildTask(context, widget.taskList[index])),
    );
  }

  Widget _buildAddTask(newList) {
    return DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(20),
        dashPattern: [10, 10],
        color: Colors.grey,
        strokeWidth: 2,
        child: GestureDetector(
          onTap: () {
            widget.taskList.removeLast();
            setState(() {
              widget.taskList.add(argTask);
              widget.taskList.add(Task(isLast: true));
            });
          },
          child: Center(
              child: Text(
            '+Add',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ));
  }
}

var argTask = Task(
  iconData: Icons.favorite_rounded,
  title: 'Health',
  bgColor: kBlueLight,
  iconColor: kBlueDark,
  btnColor: kBlue,
  left: 0,
  done: 0,
);

Widget _buildTask(BuildContext context, Task task) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailPage(task),
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: task.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            task.iconData,
            color: task.iconColor,
            size: 35,
          ),
          SizedBox(height: 20),
          Text(
            task.title!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              _buildTaskStatus(
                  task.btnColor!, task.iconColor!, '${task.left} left'),
              SizedBox(width: 5),
              _buildTaskStatus(
                  Colors.white, task.iconColor!, '${task.done} done')
            ],
          )
        ],
      ),
    ),
  );
}

Widget _buildTaskStatus(Color bgColor, Color txtColor, String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(text, style: TextStyle(color: txtColor)),
  );
}
