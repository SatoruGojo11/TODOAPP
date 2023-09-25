// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of TODO Task
  List todotask = [
    ["1st Task", false],
    ["2nd Task", false],
  ];

  //what's gonna happen when Check box Tapped
  void checkboxtap(bool? value, int index) {
    setState(() {
      todotask[index][1] = !todotask[index][1];
    });
  }

  // create new task while clicking on Floating action button

  Future createnewtask() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.yellow[500],
        content: Container(
          height: 150,
          child: Column(
            children: [
              // for taking user input
              TextField(),
              // buttons
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TO DO APP',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.yellow[200],
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          onPressed: createnewtask,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: todotask.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Check Box
                  Checkbox(
                    value: todotask[index][1],
                    onChanged: (value) => checkboxtap(value, index),
                    activeColor: Colors.black,
                  ),
                  // Task Name
                  Text(
                    todotask[index][0],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: todotask[index][1] == true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
