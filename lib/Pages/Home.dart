// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Data/database.dart';
import 'package:todoapp/Helper/logicfunctions.dart';
import 'package:todoapp/Utilities/TodoTile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  // Take reference of the hive box
  final mybox = Hive.box("taskBox");
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    super.initState();
    // first time opening the app
    if (mybox.get('TODOLIST') == null) {
      print('Home File');
      db.createdataList();
    } else {
      print('Home File');
      db.loadData();
    }
  }

  // new task controller
  TextEditingController newtaskcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Logicfuncs>(
      builder: (context, logicfunc, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'TO DO APP',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.yellow[200],
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton(
            onPressed: logicfunc.createnewtask(context, newtaskcontroller),
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            print('Home File 2');
            return TODoTile(
              Taskname: db.todoList[index][0],
              TaskCompleted: db.todoList[index][1],
              tileindex: index,
              Onchangedatcreatetask: (value) => logicfunc.createnewtask(
                context,
                newtaskcontroller,
              ),
              Onchangedatcheckboxtap: (value) => logicfunc.checkboxtap(value, index),
            );
          },
        ),
      ),
    );
  }
}
