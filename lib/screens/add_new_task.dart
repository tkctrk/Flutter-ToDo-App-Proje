import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo_app_project/constants/color.dart';
import 'package:flutter_todo_app_project/constants/tasktype.dart';
import 'package:flutter_todo_app_project/model/task.dart';
import 'package:hexcolor/hexcolor.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});

  final void Function(Task newtask) addNewTask;

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TaskType taskType = TaskType.note;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: deviceWidth,
                  height: deviceHeight / 10,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    image: DecorationImage(
                        image: AssetImage(
                            'lib/assets/images/add_new_task_header.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(
                          child: Text(
                        'Add new task',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Task Title"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        filled: true, fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Category'),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Category Selected"),
                            ),
                          );
                          ;
                          setState(() {
                            taskType = TaskType.calendar;
                          });
                        },
                        child: Image.asset('lib/assets/images/category_1.png'),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Category Selected"),
                            ),
                          );
                          ;
                          setState(() {
                            taskType = TaskType.contest;
                          });
                        },
                        child: Image.asset('lib/assets/images/category_2.png'),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Category Selected"),
                            ),
                          );
                        },
                        child: Image.asset('lib/assets/images/category_3.png'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text("Date"),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: dateController,
                                decoration: const InputDecoration(
                                    filled: true, fillColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text("Time"),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: timeController,
                                decoration: const InputDecoration(
                                    filled: true, fillColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("Description"),
                ),
                SizedBox(
                  height: 300,
                  child: TextField(
                    controller: descriptionController,
                    expands: true,
                    maxLength: null,
                    decoration: const InputDecoration(
                        filled: true, fillColor: Colors.white, isDense: true),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Task newtask = Task(
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: false,
                          type: taskType);

                      widget.addNewTask(newtask);
                      Navigator.pop(context);
                    },
                    child: const Text("Save"))
              ],
            ),
          )),
    );
  }
}
