import 'package:flutter/material.dart';
import 'package:flutter_todo_app_project/constants/color.dart';
import 'package:flutter_todo_app_project/constants/tasktype.dart';
import 'package:flutter_todo_app_project/model/task.dart';
import 'package:flutter_todo_app_project/screens/add_new_task.dart';
import 'package:flutter_todo_app_project/todoitem.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> todo = ["Study Lessons", "Run 5K", "Go to Party"];
  //List<String> completed = ["game meetup", "take out trash"];
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    List<Task> todo = [
      Task(
          title: "Study Lessons",
          description: "Study Comp11",
          isCompleted: false,
          type: TaskType.note),
      Task(
          title: "Run 5K",
          description: "Run 5K kilometers",
          isCompleted: false,
          type: TaskType.contest),
      Task(
          title: "Go to party",
          description: "Attend to party",
          isCompleted: false,
          type: TaskType.calendar)
    ];

    void addNewTask(Task newTask) {
      setState(() {
        todo.add(newTask);
      });
    }

    List<Task> completed = [];
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(children: [
            //HEADER
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/header.png"),
                  fit: BoxFit.cover,
                ),
              ),
              width: deviceWidth,
              height: deviceHeight / 3,
              color: Colors.purple,
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "October 20.2022",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "My todo List App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding
                //TOP COLUMN
                (
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Expanded(
                child: SingleChildScrollView(
                    child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: todo.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      task: completed[index],
                    );
                  },
                )),
              ),
            ),
            const Padding
                //completed text
                (
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Completed",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                    child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: completed.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      task: todo[index],
                    );
                  },
                )),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTaskScreen(
                            addNewTask: (newTask) => addNewTask(newTask),
                          )));
                },
                child: const Text('Add New Task'))
          ]),
        ),
      ),
    );
  }
}
